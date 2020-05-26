import 'package:flutter/material.dart';
import 'package:phrazer_new/styles/colors.dart';

import 'not_selected_dialog.dart';

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
          validator: (String value) {
            if (value.isEmpty) {
              return 'Email is Required';
            }
            if (!RegExp(
                    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
              return 'Please enter a valid email Address';
            }
            return null;
          },
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(45.0, 15.0, 45.0, 15.0),
        child: TextFormField(
          style: TextStyle(color: LightGray),
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(labelText: 'Password'),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Password is Required';
            }
            return null;
          },
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
