import 'package:flutter/material.dart';
import 'package:phrazer_new/components/login_form.dart';
import 'package:phrazer_new/components/not_selected_dialog.dart';
import '../styles/colors.dart';
import '../sign_in.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
              logInForm(context, _formKey),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: Text('Or try using',
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .merge(TextStyle(color: Green))),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: _signInButton(),
              ),
            ],
          )),
    );
  }

  Widget _signInButton() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(21),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(31),
          border: Border.all(
            color: LightGray,
            width: 2,
          ),
        ),
        child: Image(
          image: AssetImage("assets/images/google_logo.png"),
          height: 20.0,
          width: 20.0,
        ),
      ),
      onTap: () {
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
    );
  }
}
