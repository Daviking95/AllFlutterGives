import 'package:all_flutter_gives/FlutterUnitTesting/login_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('title', () {
    //  Arrange (Initialization)

    //  Act (Execution)

    //  Assert (Observation)
  });

  group('Given the login page pops up', () {
    test('empty email returns error string', () {
      var result = EmailFieldValidator.validate('');

      expect(result, 'Email can\'t be empty');
    });

    test('non-empty email returns null', () {
      var result = EmailFieldValidator.validate('email');

      expect(result, null);
    });

    test('empty password returns error string', () {
      var result = PasswordFieldValidator.validate('');

      expect(result, 'Password can\'t be empty');
    });

    test('non-empty password returns null', () {
      var result = PasswordFieldValidator.validate('pass');

      expect(result, null);
    });
  });
}
