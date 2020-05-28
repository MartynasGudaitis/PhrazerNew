import 'package:flutter_test/flutter_test.dart';
import 'package:phrazer_new/components/login_form.dart';

void main() {
  test('Empty password field returns an error message', () {
    var result = LogInFormFieldValidation.validatePassword('');
    expect(result, 'Password is Required');
  });

  test('Empty Email field returns an error message', () {
    var result = LogInFormFieldValidation.validateEmail('');
    expect(result, 'Email is Required');
  });

  test('Valid email address return null', () {
    var result =
        LogInFormFieldValidation.validateEmail('martynas.gudai@gmail.com');
    expect(result, null);
  });

  test('Valid password return null', () {
    var result = LogInFormFieldValidation.validatePassword('8@4UHwny');
    expect(result, null);
  });

  test('Not valid email address returns error message', () {
    var result = LogInFormFieldValidation.validateEmail('abc.123');
    expect(result, 'Please enter a valid Email Address');
  });

  test('Too short password returns error message', () {
    var result = LogInFormFieldValidation.validatePassword('8@4UHwn');
    expect(result, 'Password does not fit requirements');
  });
}
