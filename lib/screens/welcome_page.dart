import 'package:flutter/material.dart';
import 'login_page.dart';
import '../styles/colors.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/welcome.png'),
                  fit: BoxFit.cover)),
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(70.0, 140.0, 30.0, 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text('Welcome!',
                          textDirection: TextDirection.ltr,
                          style: Theme.of(context)
                              .textTheme
                              .headline
                              .merge(TextStyle(color: LightGray))),
                      Text.rich(TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'to the language ',
                            style: Theme.of(context)
                                .textTheme
                                .subhead
                                .merge(TextStyle(color: LightGray))),
                        TextSpan(
                            text: 'ocean',
                            style: Theme.of(context)
                                .textTheme
                                .subhead
                                .merge(TextStyle(color: Orange))),
                      ])),
                    ],
                  )),
              Container(
                padding: EdgeInsets.only(top: 400.0),
                child: Text('Ready to dive in?',
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .merge(TextStyle(color: Green))),
              ),
              Container(
                padding: EdgeInsets.only(top: 50.0, bottom: 20),
                child: RaisedButton(
                  textColor: LightGray,
                  color: Orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.only(
                      left: 45.0, right: 45.0, top: 15.0, bottom: 15.0),
                  child: Text(
                    'Yes'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ),
              /*
              Container(
                  child: Text.rich(TextSpan(children: <TextSpan>[
                TextSpan(
                  text: 'You are not a member? ',
                  style: Theme.of(context).textTheme.subtitle.merge(TextStyle(
                        color: DarkGreen,
                        fontWeight: FontWeight.w300,
                      )),
                ),
                TextSpan(
                  text: 'Register',
                  style: Theme.of(context).textTheme.subtitle.merge(TextStyle(
                        color: Orange,
                      )),
                )
              ]))),
              */
            ],
          )),
    );
  }
}
