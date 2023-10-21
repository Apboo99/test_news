import 'dart:ui';
import '../../../common/values/color.dart';

class SignUpState {
  final String userNameInitial;
  final String emailInitial;
  final String passwordInitial;
  final String rePasswordInitial;
  final Color colorOfButtonInitial;
  const SignUpState({this.colorOfButtonInitial=AppColors.primaryElementBg,
      this.userNameInitial = "",
      this.emailInitial = "",
      this.passwordInitial = "",
      this.rePasswordInitial = ""});
  SignUpState copyWith({String? userName,String? email,String? password,String? rePassword,Color? colorOfButton}){
    return SignUpState(
      userNameInitial: userName??userNameInitial,
      emailInitial: email??emailInitial,
      passwordInitial: password??passwordInitial,
      rePasswordInitial: rePassword??rePasswordInitial,
      colorOfButtonInitial: colorOfButton??colorOfButtonInitial
    );
}
}
