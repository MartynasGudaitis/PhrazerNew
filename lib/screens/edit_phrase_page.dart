import 'package:flutter/material.dart';
import 'package:phrazer_new/components/category_list_item.dart';
import 'package:phrazer_new/components/phrase_delete_dialog.dart';
import 'package:phrazer_new/components/phrase_form_fields.dart';
import 'package:phrazer_new/models/category.dart';
import 'package:phrazer_new/models/category_icon.dart';
import 'package:phrazer_new/providers/phrase_provider.dart';
import 'package:phrazer_new/styles/colors.dart';
import 'package:provider/provider.dart';
import 'package:phrazer_new/models/phrase.dart';

class EditPhrase extends StatefulWidget {
  final Phrase phrase;
  final String categoryId;

  // Constructor
  EditPhrase({Phrase this.phrase, String this.categoryId});

  @override
  _EditPhraseState createState() => _EditPhraseState();
}

class _EditPhraseState extends State<EditPhrase> {
  final phraseController = TextEditingController();
  final translationController = TextEditingController();
  bool newInstance = true;
  String toastMessage = 'Phrase successfully saved';
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
        phraseProvider.changeCategoryId(widget.categoryId);
      });
      // Set category ID
    } else {
      // Existing phrase
      newInstance = false;
      toastMessage = 'Phrase successfully updated';
      // Update controllers
      phraseController.text = widget.phrase.phrase;
      translationController.text = widget.phrase.translation;
      pageTitle = 'Edit Phrase';
      // Update state
      new Future.delayed(Duration.zero, () {
        final phraseProvider =
            Provider.of<PhraseProvider>(context, listen: false);
        phraseProvider.loadValues(widget.phrase);
        phraseProvider.changeCategoryId(widget.phrase.categoryId);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final phraseProvider = Provider.of<PhraseProvider>(context);
    final categoryProvider = Provider.of<List<Category>>(context);
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        actions: <Widget>[
          buildPhraseFormSaveButton(formKey, phraseProvider, context,
              toastMessage, newInstance, true),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: DarkGreen),
        padding: EdgeInsets.all(40.0),
        child: Column(
          children: <Widget>[
            Text(
              'Category'.toUpperCase(),
              style: Theme.of(context).textTheme.body2,
            ),
            Container(
              margin: EdgeInsets.only(top: 12, bottom: 12),
              child: CategoryListItem(
                  category_icons
                      .singleWhere((e) =>
                          e.name ==
                          categoryProvider
                              .singleWhere((e) => (newInstance)
                                  ? e.categoryId == widget.categoryId
                                  : e.categoryId == widget.phrase.categoryId)
                              .icon)
                      .icon,
                  false,
                  categoryProvider
                      .singleWhere((e) => (newInstance)
                          ? e.categoryId == widget.categoryId
                          : e.categoryId == widget.phrase.categoryId)
                      .name),
            ),
            Text(
              'Type in your'.toUpperCase(),
              style: Theme.of(context).textTheme.body2,
            ),
            Form(
              key: formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 42.0),
                    buildPhraseFormInputField(
                        phraseController, 'Phrase', phraseProvider),
                    SizedBox(height: 14.0),
                    buildPhraseFormInputField(
                        translationController, 'Translation', phraseProvider),
                    SizedBox(height: 14.0),
                    buildPhraseFormSaveButton(formKey, phraseProvider, context,
                        toastMessage, newInstance, false),
                  ]),
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
                phraseDeleteDialog(context, widget.phrase.phraseId);
              },
              backgroundColor: LightGreen,
            )
          : Container(),
    );
  }
}
