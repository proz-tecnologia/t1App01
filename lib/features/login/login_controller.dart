import 'package:first_app/shared/application_keys/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_states.dart';

class LoginController {
  Future<LoginState> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();

    if (email == 'jessica@teste.com' && password == '12345678') {
      prefs.setBool(SharedPreferencesKeys.userLogged, true);
      return LoginStateSuccess();
    }
    return LoginStateError('senha invalida');
  }
}
