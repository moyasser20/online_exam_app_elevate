sealed class loginStates {}

class loginIntialStates extends loginStates {}

class loginloadingStates extends loginStates {}

class loginSuccessStates extends loginStates {}

class loginErrorStates extends loginStates {
  final String message;
  loginErrorStates(this.message);
}
