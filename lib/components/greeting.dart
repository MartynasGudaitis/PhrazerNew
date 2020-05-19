import 'package:flutter/material.dart';
import 'package:phrazer_new/screens/edit_phrase_page.dart';
import 'package:phrazer_new/styles/colors.dart';
import '../sign_in.dart';

class Greeting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            'Hey ' + name + ',',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 5.0),
          child: Text(
            'Heard something new?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 5.0),
          child: Text(
            'Don\'t forget to save. It\' super easy!',
            style: TextStyle(
              color: Green,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 20.0, bottom: 30.0),
          child: RaisedButton(
            textColor: LightGray,
            color: Orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: EdgeInsets.only(
                left: 45.0, right: 45.0, top: 15.0, bottom: 15.0),
            child: Text(
              'Add New',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => EditPhrase()));
            },
          ),
        ),
      ],
    );
  }
}
