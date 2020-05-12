import 'package:flutter/material.dart';
import 'package:phrazer_new/screens/edit_phrase.dart';
import 'package:phrazer_new/styles/colors.dart';

class CreateFloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => EditPhrase()));
      },
      backgroundColor: Orange,
    );
  }
}
