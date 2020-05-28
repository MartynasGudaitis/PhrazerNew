import 'package:flutter_test/flutter_test.dart';
import 'package:phrazer_new/components/phrase_form_fields.dart';

void main() {
  test('Empty phrase field returns an error message', () {
    var result = CreatePhrasePageFieldsValidation.validate('', 'Phrase');
    expect(result, 'Phrase is required');
  });

  test('Phrase starts lower case returns an error message', () {
    var result = CreatePhrasePageFieldsValidation.validate('hello', 'Phrase');
    expect(result, 'Phrase must start with a uppercase letter');
  });

  test('Phrase contains a special character returns an error message', () {
    var result =
        CreatePhrasePageFieldsValidation.validate('Hello & Welcome', 'Phrase');
    expect(result, 'Phrase can not contain special characters');
  });

  test('Empty translation field returns an error message', () {
    var result = CreatePhrasePageFieldsValidation.validate('', 'Translation');
    expect(result, 'Translation is required');
  });

  test('Translation starts lower case returns an error message', () {
    var result =
        CreatePhrasePageFieldsValidation.validate('hello', 'Translation');
    expect(result, 'Translation must start with a uppercase letter');
  });

  test('Translation contains a special character returns an error message', () {
    var result = CreatePhrasePageFieldsValidation.validate(
        'Hello & Welcome', 'Translation');
    expect(result, 'Translation can not contain special characters');
  });
}
