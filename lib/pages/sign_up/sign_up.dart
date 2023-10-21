import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_news/common/routes/names.dart';
import 'package:test_news/controller/sign_up_controller.dart';
import '../../widgets/const_widgets.dart';
import 'bloc/sign_up_bloc.dart';
import 'bloc/sign_up_event.dart';
import 'bloc/sign_up_state.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  // bool isChecked = false;
  final formKey = GlobalKey<FormState>();

  // TextEditingController nameController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // TextEditingController rePasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: SafeArea(
            child: Form(
              key: formKey,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      bigText(text: "Hello!", color: Colors.blue),
                      const SizedBox(
                        height: 10,
                      ),
                      smallText(
                          text: "Sign up to get started", color: Colors.grey),
                      const SizedBox(
                        height: 50,
                      ),
                      Wrap(
                        children: [
                          verySmallText(text: "username", color: Colors.grey),
                          verySmallText(text: "*", color: Colors.red),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      customTextFormField(
                        width,
                        height,
                        hintText: "username",
                        typeText: TextInputType.text,
                        textForCheck: "username",
                        iconData: Icons.person,
                        eye: Icons.remove_red_eye,
                        textInputAction: TextInputAction.next,
                        func: (String value) {
                          context.read<SignUpBloc>().add(UserNameEvent(value));
                        },
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     // ScaffoldMessenger.of(context).showSnackBar(
                        //     //     const SnackBar(content: Text("enter your name!"),
                        //     //        dismissDirection: DismissDirection.down
                        //     //         ,));
                        //     return "enter your name!";
                        //   }
                        //   if (!RegExp(r'^.{3,}$').hasMatch(value)) {
                        //     return "enter a valid name!!(min 3 character)";
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //         const SnackBar(content: Text("enter a valid name!!(min 3 character)"),
                        //           dismissDirection: DismissDirection.down
                        //           ,));
                        //   }
                        //   return null;
                        // }, controller: nameController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Wrap(
                        children: [
                          verySmallText(text: "email", color: Colors.grey),
                          verySmallText(text: "*", color: Colors.red),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      customTextFormField(
                        width,
                        height,
                        hintText: "email",
                        typeText: TextInputType.emailAddress,
                        textForCheck: "email",
                        iconData: Icons.email,
                        eye: Icons.remove_red_eye,
                        textInputAction: TextInputAction.next,
                        func: (String value) {
                          context.read<SignUpBloc>().add(EmailEvent(value));
                        },
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return "enter your email!";
                        //   }
                        //   if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]')
                        //       .hasMatch(value)) {
                        //     return "please enter a valid email";
                        //   }
                        //   return null;
                        // }, controller: emailController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Wrap(
                        children: [
                          verySmallText(text: "password", color: Colors.grey),
                          verySmallText(text: "*", color: Colors.red),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      customTextFormField(
                        width,
                        height,
                        hintText: "password",
                        typeText: TextInputType.visiblePassword,
                        textForCheck: "password",
                        iconData: Icons.lock,
                        eye: Icons.remove_red_eye,
                        textInputAction: TextInputAction.next,
                        func: (String value) {
                          context.read<SignUpBloc>().add(PasswordEvent(value));
                        },
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return "enter your password!";
                        //   }
                        //
                        //   if (!RegExp(
                        //           r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#&*~]).{8,}$')
                        //       .hasMatch(value)) {
                        //     return "enter a valid password!!(min 6 character)";
                        //   }
                        //   return null;
                        // }, controller: passwordController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Wrap(
                        children: [
                          verySmallText(
                              text: "confirm password", color: Colors.grey),
                          verySmallText(text: "*", color: Colors.red),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      customTextFormField(
                        width,
                        height,
                        hintText: "confirm password",
                        typeText: TextInputType.visiblePassword,
                        textForCheck: "password",
                        iconData: Icons.lock,
                        eye: Icons.remove_red_eye,
                        textInputAction: TextInputAction.done,
                        func: (String value) {
                          context
                              .read<SignUpBloc>()
                              .add(RePasswordEvent(value));
                        },
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return "enter your rePassword!";
                        //   }
                        //   // if (rePasswordController.text !=
                        //   //     passwordController.text) {
                        //   //   ScaffoldMessenger.of(context).showSnackBar(
                        //   //       const SnackBar(
                        //   //           content: Text("password don't match")));
                        //   // }
                        //   return null;
                        // },
                        // controller: rePasswordController,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                            child: Checkbox(
                                value: true,
                                onChanged: (value) {
                                  // setState(() {
                                  //   isChecked= value!;
                                  // });
                                }),
                          ),
                          smallText(text: "Remember me", color: Colors.grey)
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      buildButtonFree(
                        width,
                        text: "Sign up",
                        colorOfText: Colors.white,
                        onTaps: () {
                          SignUpController(context: context).handleSignUp();
                        },
                      ),
                      //   jEeOVI3YHFQBvdUBFmXJVlfo7a03
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: smallText(
                              text: "or continue with", color: Colors.grey)),
                      const SizedBox(
                        height: 0,
                      ),
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
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          verySmallText(
                              text: "Already have an account?",
                              color: Colors.grey),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(AppRoutes.signIn);
                              },
                              child:
                                  smallText(text: "login", color: Colors.blue))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
