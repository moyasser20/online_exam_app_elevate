import 'package:shared_preferences/shared_preferences.dart';

class RememberMeStorage {
  static const _rememberMeKey = 'remember_me';
  static const _emailKey = 'email';
  static const _passwordKey = 'password';


  Future<void> saveRememberMe(bool rememberMe, String email, String password)async {
    final sharedpref = await SharedPreferences.getInstance();
    await sharedpref.setBool(_rememberMeKey, rememberMe);
    if(rememberMe){
      await sharedpref.setString(_emailKey, email);
      await sharedpref.setString(_passwordKey, password);
    }
    else
      {
        await sharedpref.remove(_emailKey);
        await sharedpref.remove(_passwordKey);
      }
  }

  Future<Map<String, dynamic>> loadRememberData() async {
    final sharedpref = await SharedPreferences.getInstance();
    final rememberMe = sharedpref.getBool(_rememberMeKey) ?? false;
    final email = sharedpref.getString(_emailKey) ?? '';
    final password = sharedpref.getString(_passwordKey) ?? '';

    return {
      'rememberMe': rememberMe,
      'email': email,
      'password': password,
    };

  }

}