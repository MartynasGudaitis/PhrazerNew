import 'package:flutter/material.dart';
import 'package:phrazer_new/components/category_list_item.dart';
import 'package:phrazer_new/components/not_selected_dialog.dart';
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
  bool _active = false;
  String _categoryId = '';
  String _icon = 'priority_high';
  String _name = 'No Selection';

  void _handleTap(String categoryIdValue, String iconValue, String nameValue) {
    setState(() {
      _active = true;
      _categoryId = categoryIdValue;
      _icon = iconValue;
      _name = nameValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<List<Category>>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose Category'),
          actions: <Widget>[
            FlatButton(
              child: Icon(Icons.check),
              textColor: Colors.white,
              onPressed: () {
                if (!_active) {
                  notSelectedDialog(context, 'You must select a category');
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          EditPhrase(categoryId: _categoryId)));
                }
              },
            )
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(20.0),
            color: DarkGreen,
            child: CustomScrollView(slivers: <Widget>[
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.all(15.0),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Your choise'.toUpperCase(),
                          style: Theme.of(context).textTheme.body2,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 12, bottom: 12),
                          child: CategoryListItem(
                              category_icons
                                  .singleWhere((e) => e.name == _icon)
                                  .icon,
                              _active,
                              _name),
                        ),
                        Text(
                          'Select from the list'.toUpperCase(),
                          style: Theme.of(context).textTheme.body2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
                                  onTap: () {
                                    _handleTap(
                                        categories[index].categoryId,
                                        categories[index].icon,
                                        categories[index].name);
                                  },
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
