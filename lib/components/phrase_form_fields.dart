import 'package:flutter/material.dart';
import 'package:phrazer_new/components/toast_message.dart';
import 'package:phrazer_new/providers/phrase_provider.dart';
import 'package:phrazer_new/screens/home_page.dart';
import 'package:phrazer_new/styles/colors.dart';

Widget buildPhraseFormInputField(
    TextEditingController controller, String label, PhraseProvider provider) {
  return TextFormField(
    cursorColor: Green,
    decoration: InputDecoration(labelText: label),
    controller: controller,
    maxLength: 160,
    style: TextStyle(color: LightGray),
    validator: (String value) {
      if (value.isEmpty) {
        return label + ' is Required';
      }
      return null;
    },
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
