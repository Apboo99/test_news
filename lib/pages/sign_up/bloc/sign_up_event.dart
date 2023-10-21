

abstract class SignUpEvent {}

 class UserNameEvent extends SignUpEvent{
  final String userName;
   UserNameEvent(this.userName);
}
class EmailEvent extends SignUpEvent{
  final String email;
  EmailEvent(this.email);
}
class PasswordEvent extends SignUpEvent{
  final String password;
  PasswordEvent(this.password);
}
class RePasswordEvent extends SignUpEvent{
  final String rePassword;
  RePasswordEvent(this.rePassword);
}
// class ChangeBackgroundOfButton extends SignUpEvent{
//   final Color colorOfButton;
//    ChangeBackgroundOfButton(this.colorOfButton);
// }
