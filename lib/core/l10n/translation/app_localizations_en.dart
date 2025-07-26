// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Online Exam App';
  String get LoginSuccessMsg => "Login Successful ✅";
  String get LoginElevatedButton => "Login";
  String get RememberMeBox => "Remember me";
  String get ForgetPasswordTextButton => "Forget Password?";
  String get DonthaveanaccountText => "Don't have an account?";
  String get Signup => "Sign up";
  String get signupSuccessMsg => "Signup Successful ✅";
  String get signupElevatedButton => "Signup";
  String get haveAccText => "Already have an account?";
  String get loginTextButton => "Login?";
  String get ContinueButton => "Continue";
  String get WrongPasswordErrorMsg => "Wrong password, Try Again";
  String get password => "Password";
  String get ConfirmPasswordHint => "Confirm Password";
  String get ConfirmPasswordLabel => "Confirm Password";
  String get newPasswordLabel => "New Password";
  String get newPasswordHint => "Enter your password";
  String get ForgetPassword => "Forget Password";
  String get ResetPassword => "Reset Password";
  String get ResetPasswordunderMsg => "Password must not be empty and must contain 6 characters with upper case letter and one number at least";
  String get requiredEmailErrorMessage => "Email is required";
  String get EmailVarficationScreen => "Email verification";
  String get EmailVarficationScreenUnderMsg => "Please enter your code that was sent to your\nemail address";
  String get validationEmailErrorMessage => "This Email is not valid";
  String get CodeErrorMsg => "Invalid code";
  String get CodeReciveMsgError => "Didn't receive code?";
  String get ForgetPasswordunderText => "Please enter your email associated to\nyour account";
}
