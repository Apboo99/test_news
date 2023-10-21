import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_news/pages/sign_up/bloc/sign_up_event.dart';
import 'package:test_news/pages/sign_up/bloc/sign_up_state.dart';


class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<UserNameEvent>(_userNameBloc);
    on<EmailEvent>(_emailBloc);
    on<PasswordEvent>(_passwordBloc);
    on<RePasswordEvent>(_rePasswordBloc);
    // on<ChangeBackgroundOfButton>(_changeColorBloc);

  }
  void _userNameBloc(UserNameEvent event,Emitter<SignUpState>emit){
    // print(event.userName);
    emit(state.copyWith(userName: event.userName));
  }
  void _emailBloc(EmailEvent event,Emitter<SignUpState>emit){
    // print(event.email);
    emit(state.copyWith(email: event.email));
  }
  void _passwordBloc(PasswordEvent event,Emitter<SignUpState>emit){
    // print(event.password);
    emit(state.copyWith(password: event.password));
  }
  void _rePasswordBloc(RePasswordEvent event,Emitter<SignUpState>emit){
    // print(event.rePassword);
    emit(state.copyWith(rePassword: event.rePassword));
  }
  // void _changeColorBloc(ChangeBackgroundOfButton event,Emitter<SignUpState>emit){
  //   // print(event.rePassword);
  //   emit(state.copyWith(colorOfButton: event.colorOfButton));
  // }
}
