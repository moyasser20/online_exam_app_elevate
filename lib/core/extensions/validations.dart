abstract class Validations {

  static bool validateEmail(String email) {
    final RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(email);
  }

  static bool validatePassword(String password) {
    final RegExp passwordRegExp =
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

    return passwordRegExp.hasMatch(password);
  }

  static bool validateUsername(String username) {
    final RegExp usernameRegExp = RegExp(r'^[a-zA-Z0-9_]{3,20}$');
    return usernameRegExp.hasMatch(username);
  }

}
