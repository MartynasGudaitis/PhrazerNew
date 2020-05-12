import 'package:flutter/material.dart';
import 'package:phrazer_new/models/phrase.dart';
import 'package:phrazer_new/screens/edit_phrase.dart';
import 'package:phrazer_new/styles/colors.dart';
import 'package:provider/provider.dart';

class PhrasesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final phrases = Provider.of<List<Phrase>>(context);
    return (phrases != null)
        ? Expanded(
            child: ListView.builder(
                //scrollDirection: Axis.vertical,
                //: true,
                itemCount: phrases.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 15.0),
                    decoration: BoxDecoration(
                        color: LightGreen,
                        borderRadius: BorderRadius.circular(14.0)),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.fromLTRB(16.0, 13.0, 16.0, 13.0),
                      title: Text(
                        phrases[index].phrase,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Container(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(phrases[index].translation,
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic)),
                      ),
                      trailing: Icon(
                        Icons.volume_up,
                        color: Green,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditPhrase(phrases[index])));
                      },
                    ),
                  );
                }),
          )
        : Center(child: CircularProgressIndicator());
  }
}
