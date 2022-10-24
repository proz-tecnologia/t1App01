import 'package:first_app/features/authentication/splash_states.dart';
import 'package:first_app/shared/application_keys/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController {
  Future<SplashState> isAuthenticated() async {
    final prefs = await SharedPreferences.getInstance();
    final isAuthenticated =
        prefs.getBool(SharedPreferencesKeys.userLogged) ?? false;

    if (isAuthenticated) {
      return SplashStateAuthenticated();
    } else {
      return SplashStateUnauthenticated();
    }
  }
}
