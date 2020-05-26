import 'package:flutter/material.dart';
import 'package:phrazer_new/components/toast_message.dart';
import 'package:phrazer_new/providers/phrase_provider.dart';
import 'package:phrazer_new/styles/colors.dart';
import 'package:provider/provider.dart';

phraseDeleteDialog(BuildContext context, String phraseId) {
  final phraseProvider = Provider.of<PhraseProvider>(context, listen: false);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: DarkGreen,
        title: Text('Message', style: TextStyle(color: Green)),
        content: Text('Are you sure you want to delete this phrase?',
            style: TextStyle(color: LightGray)),
        actions: [
          FlatButton(
            child: Text('Yes', style: TextStyle(color: LightGray)),
            onPressed: () {
              phraseProvider.removePhrase(phraseId);
              int count = 0;
              Navigator.popUntil(context, (route) {
                return count++ == 2;
              });
              toastMessage(context, 'Phrase successfully deleted');
            },
          ),
          FlatButton(
            child: Text('Cancel', style: TextStyle(color: Orange)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
