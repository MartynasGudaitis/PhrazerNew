import 'package:flutter/material.dart';
import 'package:phrazer_new/components/toast_message.dart';
import 'package:phrazer_new/providers/phrase_provider.dart';
import 'package:phrazer_new/screens/home_page.dart';
import 'package:phrazer_new/styles/colors.dart';

class CreatePhrasePageFieldsValidation {
  static String validate(String value, String label) {
    RegExp regExpUpperCase = new RegExp(r'^(?=.*?[A-Z])');
    RegExp regExpSpecialCharacters = new RegExp(r'^(?=.*[@#\/$&*~])');
    if (value.isEmpty)
      return label + ' is required';
    else if (!regExpUpperCase.hasMatch(value[0]))
      return label + ' must start with a uppercase letter';
    else if (regExpSpecialCharacters.hasMatch(value) == true)
      return label + ' can not contain special characters';
    else
      return null;
  }
}

Widget buildPhraseFormInputField(
    TextEditingController controller, String label, PhraseProvider provider) {
  return TextFormField(
    cursorColor: Green,
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(labelText: label),
    controller: controller,
    style: TextStyle(color: LightGray),
    maxLength: 160,
    validator: (String value) =>
        CreatePhrasePageFieldsValidation.validate(value, label),
    onSaved: (String value) {
      (label == 'Phrase')
          ? provider.changePhrase(value)
          : provider.changeTranslation(value);
    },
  );
}

Widget buildPhraseFormSaveButton(
    GlobalKey<FormState> formKey,
    PhraseProvider provider,
    BuildContext context,
    String message,
    bool isNewInstance,
    bool isIcon) {
  return GestureDetector(
    child: (isIcon)
        ? Container(
            margin: EdgeInsets.only(right: 12),
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
          )
        : Container(
            padding: EdgeInsets.fromLTRB(45.0, 15.0, 45.0, 15.0),
            decoration: BoxDecoration(
              color: Orange,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text(
              'Save',
              style: TextStyle(color: LightGray),
            ),
          ),
    onTap: () {
      if (!formKey.currentState.validate()) {
        return;
      }

      (isNewInstance)
          ? Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomePage()))
          : Navigator.of(context).pop();
      toastMessage(context, message);
      formKey.currentState.save();
      provider.savePhrase();
    },
  );
}
