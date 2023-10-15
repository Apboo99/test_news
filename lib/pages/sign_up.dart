import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:test_news/models/user_model.dart';


import '../widgets/const_widgets.dart';
import '../widgets/flutter_toast.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    // bool? isCheck = false;
    // bool? newwCheck;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bigText(text: "Hello!", color: Colors.blue),
                  const SizedBox(height: 10,),
                  smallText(text: "Sign up to get started", color: Colors.grey),
                  const SizedBox(height: 50,),
                   Wrap(
                    children: [
                      verySmallText(text: "username", color: Colors.grey),
                      verySmallText(text: "*", color: Colors.red),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  customTextFormField(width, height,
                      hintText: "username",
                      typeText: TextInputType.text,
                      textForCheck: "username", iconData: Icons.person, eye: Icons.remove_red_eye,
                      textInputAction: TextInputAction.next,
                      controller: nameController,
                      func: (String value) {
                    nameController.text = value;
                      },validator: (value) {
                        if(value!.isEmpty){
                          return "enter your name!";
                        }
                        if(!RegExp(r'^.{3,}$').hasMatch(value)){
                          return "enter a valid name!!(min 3 character)";
                        }
                        return "";
                      }
                      ),
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
    textInputAction: TextInputAction.next,
    controller: emailController,
    func: (String value) {
    emailController.text = value;},
                      validator: (value) {
                        if(value!.isEmpty){
                          return "enter your email!";
                        }
                        if(!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(value)){
                          return "please enter a valid email";
                        }
                        return "";
                      }
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
                      textForCheck: "password", iconData: Icons.lock,
                      eye: Icons.remove_red_eye,
    textInputAction: TextInputAction.next,
    controller: passwordController,
    func: (String value) {
    passwordController.text = value;},
                      validator: (value) {
                        if(value!.isEmpty){
                          return "enter your password!";
                        }

                        if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
                          return "enter a valid password!!(min 6 character)";
                        }
                        return "";
                      }

                  ),
                  const SizedBox(height: 15,),
                  Wrap(
                    children: [
                      verySmallText(text: "confirm password", color: Colors.grey),
                      verySmallText(text: "*", color: Colors.red),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  customTextFormField(width, height,
                      hintText: "confirm password",
                      typeText: TextInputType.visiblePassword,
                      textForCheck: "password", iconData: Icons.lock,
                      eye: Icons.remove_red_eye,
    textInputAction: TextInputAction.done,
    controller: rePasswordController,
    func: (String value) {
    rePasswordController.text = value;},
                      validator: (value) {
                        if(rePasswordController.text != passwordController.text){
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("password don't match")));
                        }
                        return "";
                      }
                  ),
                   Row(
                    children: [
                      Container(
                        width: 25,
                        child: Checkbox(value: true, onChanged: (isCheck){

                        }),
                      ),
                      smallText(text: "Remember me", color: Colors.grey)
                    ],
                  ),
                  const SizedBox(height: 10,),
                  buildButtonFree(width,
                      text: "Sign up",
                      colorOfText: Colors.white,
                      onTaps: (){

                        handelSignUp(emailController.text,passwordController.text);
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
                      verySmallText(text: "Already have an account?", color: Colors.grey),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed("/sign_in");
                        },
                          child: smallText(text:"login", color: Colors.blue))
                    ],
                  )


                ],
              ),
            ),
          ),
        ),
      )
    );
  }
  void handelSignUp(String email,String password)async{
    if(formKey.currentState!.validate()){
      await auth.createUserWithEmailAndPassword(email: email, password: password).then((value) =>{
        postDetailsOfUserToFireStore()
        // toastInfo(message: "Created success"),
      }).catchError((e){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    });
    }

  }
  postDetailsOfUserToFireStore()async{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? user = auth.currentUser;
  UserModel userModel = UserModel();
  userModel.uid = user!.uid;
  userModel.name = nameController.text;
  userModel.email = user!.email;
  
  await firestore.collection("users").doc(user.uid).set(userModel.toMap({}));
  showSnak();
  Get.offNamedUntil("/home", (route) => false);
  }

  void showSnak() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Account created")));
  }
  }

