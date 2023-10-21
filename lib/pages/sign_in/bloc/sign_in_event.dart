part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

////////////////////////////////////////////////////////

class EmailEvent extends SignInEvent {
  final String email;
  EmailEvent(this.email);
}
////////////////////////////////////////////////////////

class PasswordEvent extends SignInEvent {
  final String password;
  PasswordEvent(this.password);
}

