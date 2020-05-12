import 'package:flutter/material.dart';
import 'package:phrazer_new/components/create_float_btn.dart';
import 'package:phrazer_new/components/phrases_list.dart';
import 'package:phrazer_new/screens/edit_phrase.dart';
import '../sign_in.dart';
import '../styles/colors.dart';
import '../components/singout_dialog.dart';

class PhrasesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Green,
          title: Text('Airport'),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.all(12.0),
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            FlatButton(
                padding: EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(imageUrl),
                ),
                onPressed: () {
                  showAlertDialog(context);
                }),
          ],
        ),
        body: Container(
            padding: EdgeInsets.only(left: 25.0, right: 25.0),
            decoration: BoxDecoration(color: DarkGreen),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 15.0),
                  child: Text(
                    'My Phrases',
                    style: Theme.of(context).textTheme.body1.merge(TextStyle(
                          color: Colors.white,
                        )),
                  ),
                ),
                Container(child: PhrasesList()),
              ],
            )),
        floatingActionButton: CreateFloatingButton());
  }
}
