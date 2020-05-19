import 'package:flutter/material.dart';
import '../screens/welcome_page.dart';
import '../sign_in.dart';
import '../styles/colors.dart';

showAlertDialog(BuildContext context) {
  // set up the button
  Widget singOutButton = FlatButton(
    child: Text('Sing out', style: TextStyle(color: LightGray)),
    onPressed: () {
      signOutGoogle();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
        return WelcomePage();
      }), ModalRoute.withName('/'));
    },
  );

  Widget closeButton = FlatButton(
    child: Text('Close', style: TextStyle(color: Orange)),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  Widget userInfo = Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(imageUrl, height: 40.0, width: 40.0),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(name,
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .merge(TextStyle(color: LightGray))),
          )
        ],
      ),
      Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Text(email,
            style: Theme.of(context)
                .textTheme
                .subhead
                .merge(TextStyle(color: LightGray))),
      )
    ],
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: DarkGreen,
    title: Text('Account', style: TextStyle(color: Green)),
    content: userInfo,
    actions: [singOutButton, closeButton],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
