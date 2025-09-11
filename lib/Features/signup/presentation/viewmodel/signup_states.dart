sealed class SignupStates {}

class SignupInitialStates extends SignupStates {}

class SignupLoadingStates extends SignupStates {}

class SignupSuccessStates extends SignupStates {}

class SignupErrorStates extends SignupStates {
  final String message;
  SignupErrorStates(this.message);
}
