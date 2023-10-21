 class SignInState {
  final String emailInitial;
  final String passwordInitial;
  const SignInState({required this.emailInitial, required this.passwordInitial});

  // i made the variables optional here because i will access each variable in one process
  SignInState changeValuesOfSignIn({String? email, String? password}) {
    return SignInState(
      // here we put email value in emailInitial and if email value == Null ? emailInitial do not change.
    emailInitial: email ?? emailInitial,
        passwordInitial: password ?? passwordInitial);
  }
}
