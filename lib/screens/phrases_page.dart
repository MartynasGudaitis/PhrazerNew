import 'package:flutter/material.dart';
import 'package:phrazer_new/components/create_float_btn.dart';
import 'package:phrazer_new/components/not_found.dart';
import 'package:phrazer_new/components/phrases_list_item.dart';
import 'package:phrazer_new/models/category.dart';
import 'package:phrazer_new/models/phrase.dart';
import 'package:phrazer_new/screens/search_page.dart';
import 'package:provider/provider.dart';
import '../sign_in.dart';
import '../styles/colors.dart';
import '../components/singout_dialog.dart';
import 'edit_category_page.dart';

class PhrasesPage extends StatefulWidget {
  final String categoryId;
  final String title;

  // Constructor
  PhrasesPage({String this.categoryId, String this.title});

  @override
  _PhrasesPageState createState() => _PhrasesPageState();
}

class _PhrasesPageState extends State<PhrasesPage> {
  bool _isNotEmpty;
  @override
  void initState() {
    final phrases = Provider.of<List<Phrase>>(context, listen: false);
    for (Phrase phrase in phrases) {
      if (phrase.categoryId == widget.categoryId) {
        _isNotEmpty = true;
        break;
      } else {
        _isNotEmpty = false;
      }
    }
    ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final phrases = Provider.of<List<Phrase>>(context);
    final categories = Provider.of<List<Category>>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.all(12.0),
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchPage();
                    },
                  ),
                );
              },
            ),
            IconButton(
              padding: EdgeInsets.all(12.0),
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditCategory(
                          category: categories.singleWhere(
                              (e) => e.categoryId == widget.categoryId),
                        )));
              },
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
            child: (_isNotEmpty)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 15.0),
                        child: Text(
                          'My Phrases',
                          style:
                              Theme.of(context).textTheme.body1.merge(TextStyle(
                                    color: Colors.white,
                                  )),
                        ),
                      ),
                      Expanded(
                          child: (phrases != null)
                              ? ListView(children: <Widget>[
                                  for (var phrase in phrases)
                                    (phrase.categoryId == widget.categoryId)
                                        ? PhrasesListItem(phrase: phrase)
                                        : Container(),
                                ])
                              : Center(child: CircularProgressIndicator())),
                    ],
                  )
                : NotFound()),
        floatingActionButton: CreateFloatingButton());
  }
}
