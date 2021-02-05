import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterdemo/main.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

final FlutterAppAuth appAuth = FlutterAppAuth();
final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Login Tests', () {
    var appstate = MyApp().createState();

    test('Before Log in action', () {
      expect(appstate.isBusy, false);
      expect(appstate.isLoggedIn, false);
      expect(appstate.errorMessage, isNot(''));
    });

    test('Log out action', () {
      appstate.logoutAction();
      expect(appstate.isBusy, false);
      expect(appstate.isLoggedIn, false);
      expect(appstate.errorMessage, null);
    });

  });
}