
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_news/pages/sign_in/bloc/sign_in_state.dart';

part 'sign_in_event.dart';


class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc():super( const SignInState(emailInitial: '', passwordInitial: '')){
    on<EmailEvent>(_emailBloc);
    on<PasswordEvent>(_passwordBloc);

}
void _emailBloc(EmailEvent event,Emitter<SignInState> emit){

    emit(state.changeValuesOfSignIn(email: event.email));

    // print("your email is ${event.email}");
}

void _passwordBloc(PasswordEvent event,Emitter<SignInState>emit){
  // print("your password is ${event.password}");
    emit(state.changeValuesOfSignIn(password: event.password));
}

}
