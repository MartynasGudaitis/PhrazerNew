import 'package:flutter/material.dart';
import 'package:phrazer_new/providers/phrase_provider.dart';
import 'package:phrazer_new/styles/colors.dart';
import 'package:provider/provider.dart';
import 'package:phrazer_new/models/phrase.dart';

class EditPhrase extends StatefulWidget {
  final Phrase phrase;

  // Constructor
  EditPhrase([this.phrase]);

  @override
  _EditPhraseState createState() => _EditPhraseState();
}

class _EditPhraseState extends State<EditPhrase> {
  final phraseController = TextEditingController();
  final translationController = TextEditingController();
  String pageTitle;

  @override
  void dispose() {
    phraseController.dispose();
    translationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.phrase == null) {
      // New phrase
      phraseController.text = '';
      translationController.text = '';
      pageTitle = 'Create Phrase';
      new Future.delayed(Duration.zero, () {
        final phraseProvider =
            Provider.of<PhraseProvider>(context, listen: false);
        phraseProvider.loadValues(Phrase());
      });
    } else {
      // Existing phrase
      // Update controllers
      phraseController.text = widget.phrase.phrase;
      translationController.text = widget.phrase.translation;
      pageTitle = 'Edit Phrase';
      // Update state
      new Future.delayed(Duration.zero, () {
        final phraseProvider =
            Provider.of<PhraseProvider>(context, listen: false);
        phraseProvider.loadValues(widget.phrase);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final phraseProvider = Provider.of<PhraseProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.check),
            textColor: Colors.white,
            onPressed: () {
              phraseProvider.savePhrase();
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: DarkGreen),
        padding: EdgeInsets.all(40.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 100.0, bottom: 25.0),
              child: TextField(
                controller: phraseController,
                style: TextStyle(color: LightGray),
                decoration: InputDecoration(hintText: 'Phrase'),
                onChanged: (value) {
                  phraseProvider.changePhrase(value);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 25.0),
              child: TextField(
                controller: translationController,
                style: TextStyle(color: LightGray),
                decoration: InputDecoration(hintText: 'Translation'),
                onChanged: (value) {
                  phraseProvider.changeTranslation(value);
                },
              ),
            ),
            Container(
              child: RaisedButton(
                child: Text('Save'),
                textColor: LightGray,
                color: Orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.only(
                    left: 45.0, right: 45.0, top: 15.0, bottom: 15.0),
                onPressed: () {
                  phraseProvider.savePhrase();
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: (widget.phrase != null)
          ? FloatingActionButton(
              child: Icon(
                Icons.delete,
                color: Green,
              ),
              onPressed: () {
                phraseProvider.removePhrase(widget.phrase.phraseId);
                Navigator.of(context).pop();
              },
              backgroundColor: LightGreen,
            )
          : Container(),
    );
  }
}
