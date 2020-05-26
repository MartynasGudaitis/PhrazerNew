import 'package:flutter/material.dart';
import 'package:phrazer_new/models/phrase.dart';
import 'package:phrazer_new/screens/edit_phrase_page.dart';
import 'package:phrazer_new/styles/colors.dart';

class PhrasesListItem extends StatefulWidget {
  final Phrase phrase;

  // Constructor
  PhrasesListItem({Phrase this.phrase});

  @override
  _PhrasesListItemState createState() => _PhrasesListItemState();
}

class _PhrasesListItemState extends State<PhrasesListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Container(
            margin: EdgeInsets.only(bottom: 15.0),
            decoration: BoxDecoration(
                color: LightGreen, borderRadius: BorderRadius.circular(14.0)),
            child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(16.0, 13.0, 16.0, 13.0),
                title: Text(
                  widget.phrase.phrase,
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(widget.phrase.translation,
                      style: TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic)),
                ),
                trailing: Icon(
                  Icons.volume_up,
                  color: Green,
                ))),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditPhrase(phrase: widget.phrase)));
        },
      ),
    );
  }
}
