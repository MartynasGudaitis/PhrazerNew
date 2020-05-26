import 'package:flutter/material.dart';
import 'package:phrazer_new/components/phrases_list_item.dart';
import 'package:phrazer_new/models/phrase.dart';
import 'package:phrazer_new/styles/colors.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Phrase> phrases = [];
  List<Phrase> filteredPhrases = [];

  @override
  void initState() {
    new Future.delayed(Duration.zero, () {
      phrases = Provider.of<List<Phrase>>(context, listen: false);
      filteredPhrases = phrases;
    });
    super.initState();
  }

  void _onSearch(value) {
    setState(() {
      filteredPhrases =
          phrases.where((phrase) => phrase.phrase.contains('$value')).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final phrases = Provider.of<List<Phrase>>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Phrase'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        color: DarkGreen,
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 21),
            child: TextField(
              style: TextStyle(color: LightGray),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: LightGray,
                ),
                hintText: 'Search for phrases',
              ),
              onChanged: _onSearch,
            ),
          ),
          (filteredPhrases != null)
              ? Expanded(
                  child: ListView.builder(
                    itemCount: filteredPhrases.length,
                    itemBuilder: (context, index) {
                      return PhrasesListItem(phrase: filteredPhrases[index]);
                    },
                  ),
                )
              : Container(),
        ]),
      ),
    );
  }
}
