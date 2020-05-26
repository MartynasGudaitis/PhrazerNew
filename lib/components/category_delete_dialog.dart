import 'package:flutter/material.dart';
import 'package:phrazer_new/components/toast_message.dart';
import 'package:phrazer_new/models/phrase.dart';
import 'package:phrazer_new/providers/category_provider.dart';
import 'package:phrazer_new/screens/home_page.dart';
import 'package:phrazer_new/styles/colors.dart';
import 'package:provider/provider.dart';

categoryDeleteDialog(BuildContext context, String categoryId) {
  final categoryProvider =
      Provider.of<CategoryProvider>(context, listen: false);
  final phrases = Provider.of<List<Phrase>>(context, listen: false);
  bool _deleteActive = phrases.any((e) => e.categoryId == categoryId);
  print(_deleteActive);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: DarkGreen,
        title: Text('Message', style: TextStyle(color: Green)),
        content: Text(
            (!_deleteActive)
                ? 'Are you sure you want to delete this category?'
                : 'This action can not be done because there are phrases which belong to this category',
            style: TextStyle(color: LightGray)),
        actions: [
          (!_deleteActive)
              ? FlatButton(
                  child: Text('Yes', style: TextStyle(color: LightGray)),
                  onPressed: () {
                    categoryProvider.removeCategory(categoryId);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                    toastMessage(context, 'Category successfully deleted');
                  },
                )
              : null,
          FlatButton(
            child: Text((!_deleteActive) ? 'Cancel' : 'Okay',
                style: TextStyle(color: Orange)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
