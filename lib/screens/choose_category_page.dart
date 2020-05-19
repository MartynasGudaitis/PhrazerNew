import 'package:flutter/material.dart';
import 'package:phrazer_new/components/category_list_item.dart';
import 'package:phrazer_new/models/category.dart';
import 'package:phrazer_new/models/category_icon.dart';
import 'package:phrazer_new/styles/colors.dart';
import 'package:provider/provider.dart';
import 'edit_category_page.dart';
import 'edit_phrase_page.dart';

class ChooseCategoryPage extends StatefulWidget {
  @override
  _ChooseCategoryPageState createState() => _ChooseCategoryPageState();
}

class _ChooseCategoryPageState extends State<ChooseCategoryPage> {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<List<Category>>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Green,
          title: Text('Choose Category'),
          actions: <Widget>[
            FlatButton(
              child: Icon(Icons.check),
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditPhrase()));
              },
            )
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(20.0),
            color: DarkGreen,
            child: CustomScrollView(slivers: <Widget>[
              (categories != null)
                  ? SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return (index < categories.length)
                              ? GestureDetector(
                                  child: CategoryListItem(
                                      category_icons
                                          .singleWhere((e) =>
                                              e.name == categories[index].icon)
                                          .icon,
                                      false,
                                      categories[index].name),
                                  onTap: () {},
                                )
                              : GestureDetector(
                                  child: CategoryListItem(
                                      Icons.add, false, 'Create New'),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditCategory()));
                                  },
                                );
                        },
                        childCount: categories.length + 1,
                      ))
                  : SliverToBoxAdapter(child: CircularProgressIndicator()),
            ])));
  }
}
