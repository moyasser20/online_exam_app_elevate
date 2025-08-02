abstract class ChangePasswordStates {}

class ChangePasswordInitial extends ChangePasswordStates {}

class ChangePasswordLoading extends ChangePasswordStates {}

class ChangePasswordSuccess extends ChangePasswordStates {}

class ChangePasswordError extends ChangePasswordStates {
  final String message;

  ChangePasswordError(this.message);
}
