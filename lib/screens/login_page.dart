import 'package:flutter/material.dart';
import '../styles/colors.dart';
import '../sign_in.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/logIn.png'),
                  fit: BoxFit.cover)),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(70.0, 140.0, 30.0, 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text('I\'m happy',
                        textDirection: TextDirection.ltr,
                        style: Theme.of(context)
                            .textTheme
                            .headline
                            .merge(TextStyle(color: LightGray))),
                    Text('to see you again',
                        textDirection: TextDirection.ltr,
                        style: Theme.of(context)
                            .textTheme
                            .subhead
                            .merge(TextStyle(color: Green))),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(45.0, 50.0, 45.0, 15.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(45.0, 15.0, 45.0, 15.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: Text('you can also sign in with',
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context)
                        .textTheme
                        .subhead
                        .merge(TextStyle(color: Green))),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: _signInButton(),
              ),
              /*
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
                    'Log In'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                ),
              ),
              */
            ],
          )),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      highlightedBorderColor: Colors.white,
      onPressed: () {
        signInWithGoogle().whenComplete(() {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return HomePage();
              },
            ),
          );
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: LightGray, width: 2.0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
                image: AssetImage("assets/images/google_logo.png"),
                height: 30.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Google',
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .merge(TextStyle(color: LightGray)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
