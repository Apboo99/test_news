import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:test_news/common/routes/names.dart';
import 'package:test_news/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:test_news/pages/sign_in/bloc/sign_in_state.dart';
import 'package:test_news/controller/sign_in_controller.dart';
import 'package:test_news/widgets/flutter_toast.dart';


import '../../common/services/global.dart';
import '../../common/values/constant.dart';
import '../../widgets/const_widgets.dart';
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // final formKey = GlobalKey<FormState>();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return  BlocBuilder<SignInBloc, SignInState>(
  builder: (context, state) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: Form(
            // key: formKey,
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 70,horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bigText(text: "Hello", color: Colors.black),
                    const SizedBox(height: 10,),
                    bigText(text: "Again!", color: Colors.blue),
                    const SizedBox(height: 10,),
                    smallText(text: "Welcome back you've\nbeen missed", color: Colors.grey.shade700),
                    const SizedBox(height: 40,),
                    const SizedBox(height: 15,),
                    Wrap(
                      children: [
                        verySmallText(text: "email", color: Colors.grey),
                        verySmallText(text: "*", color: Colors.red),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    customTextFormField(width, height,
                        hintText: "email",
                        typeText: TextInputType.emailAddress,
                        textForCheck: "email", iconData: Icons.email,
                        eye: Icons.remove_red_eye,
                        func: (String value) {
                          context.read<SignInBloc>().add(EmailEvent(value));
                        }, textInputAction: TextInputAction.next,
                      //   validator: (value) {
                      // if(value!.isEmpty){
                      //   return "please enter your email";
                      //   // ScaffoldMessenger.of(context).
                      //   // showSnackBar(SnackBar(content: Text("please enter your email")));
                      // }
                      // if(!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(value)){
                      //     return "please enter a valid email";
                      // }
                      // return null;
                      //   },
                        // controller: emailController
                    ),
                    const SizedBox(height: 15,),

                    Wrap(
                      children: [
                        verySmallText(text: "password", color: Colors.grey),
                        verySmallText(text: "*", color: Colors.red),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    customTextFormField(width, height,
                        hintText: "password",
                        typeText: TextInputType.visiblePassword,
                        textForCheck: "password",
                        iconData: Icons.lock,
                        eye: Icons.remove_red_eye,
                        func: (String value) {
                          context.read<SignInBloc>().add(PasswordEvent(value));
                        }, textInputAction: TextInputAction.done,
                        // validator: (value) {
                        //   if(value!.isEmpty){
                        //     return "enter your password!";
                        //   }
                        //   if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
                        //     return "enter a valid password!!(min 6 character)";
                        //   }
                        //   return null;
                        // }, controller: passwordController
                    ),

                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 25,
                                child: Checkbox(value: true, onChanged: (isCheck){
                                }),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: smallText(text: "Remember me", color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                         smallText(text: "forget password?", color: Colors.blue)
                      ],
                    ),
                    const SizedBox(height: 10,),
                    buildButtonFree(width,
                        text: "Login",
                        colorOfText: Colors.white,
                        onTaps: (){
                          Global.storageServices
                              .setBool(AppConstant.onUserLogin, true);
                          SignInController(context: context)
                              .handleSignIn("email");
                          // Navigator.of(context).pushNamed("/home");
                        }),
                    const SizedBox(height: 20,),
                    Center(child: smallText(text: "or continue with", color: Colors.grey)),
                    const SizedBox(height: 0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customSocialButton(width, height,
                            text: "facebook",
                            icon: "assets/images/facebook.jpeg"),
                        customSocialButton(width, height,
                            text: "google",
                            icon: "assets/images/google.jpeg"),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        verySmallText(text: "don't have an account?", color: Colors.grey),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed(AppRoutes.signUp);
                          },
                            child: smallText(text:"sign up", color: Colors.blue))
                      ],
                    )


                  ],
                ),
              ),
            ),
          ),
        )
    );
  },
);
  }
 // void handleSignIn(String email,String password)async{
 //    if(formKey.currentState!.validate()){
 //      await auth.signInWithEmailAndPassword(email: email, password: password).
 //      then((uid) => {
 //        toastInfo(message: "login success"),
 //        Get.toNamed("/home"),
 //      }).catchError((e){
 //        ScaffoldMessenger.of(context).
 //        showSnackBar( SnackBar(content: Text(e.toString())));
 //      }
 //      );
 //    }
 //  }
}
