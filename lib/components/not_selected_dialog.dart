import 'package:flutter/material.dart';
import 'package:phrazer_new/styles/colors.dart';

notSelectedDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: DarkGreen,
        content: Text(message, style: TextStyle(color: LightGray)),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay', style: TextStyle(color: Orange)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
