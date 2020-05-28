import 'package:flutter/material.dart';
import 'package:phrazer_new/styles/colors.dart';
import 'not_selected_dialog.dart';

class LogInFormFieldValidation {
  static String validatePassword(String value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    // (?=.*[A-Z]) should contain at least one upper case
    // (?=.*[a-z]) should contain at least one lower case
    // (?=.*?[0-9]) should contain at least one digit
    // (?=.*?[!@#\$&*~]).{8,} should contain at least one Special character
    RegExp regEx = new RegExp(pattern);
    if (value.isEmpty) {
      return 'Password is Required';
    } else {
      if (!regEx.hasMatch(value))
        return 'Password does not fit requirements';
      else
        return null;
    }
  }

  static String validateEmail(String value) {
    Pattern pattern =
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
    RegExp regEx = new RegExp(pattern);
    if (value.isEmpty) {
      return 'Email is Required';
    } else {
      if (!regEx.hasMatch(value))
        return 'Please enter a valid Email Address';
      else
        return null;
    }
  }
}

Widget logInForm(BuildContext context, GlobalKey<FormState> _formKey) {
  return Form(
    key: _formKey,
    child: Column(children: <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(45.0, 50.0, 45.0, 15.0),
        child: TextFormField(
          style: TextStyle(color: LightGray),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(labelText: 'E-mail'),
          validator: (String value) =>
              LogInFormFieldValidation.validateEmail(value),
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(45.0, 15.0, 45.0, 15.0),
        child: TextFormField(
          style: TextStyle(color: LightGray),
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(labelText: 'Password'),
          validator: (String value) =>
              LogInFormFieldValidation.validatePassword(value),
        ),
      ),
      Container(
        child: RaisedButton(
          textColor: LightGray,
          color: Orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding:
              EdgeInsets.only(left: 45.0, right: 45.0, top: 15.0, bottom: 15.0),
          child: Text(
            'Log In'.toUpperCase(),
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          onPressed: () {
            if (!_formKey.currentState.validate()) {
              return;
            }

            notSelectedDialog(
                context, 'Sorry, but this feature is not working yet');
          },
        ),
      )
    ]),
  );
}
