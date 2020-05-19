import 'package:flutter/material.dart';
import 'package:phrazer_new/components/category_list_item.dart';
import 'package:phrazer_new/models/category_icon.dart';
import 'package:phrazer_new/providers/category_provider.dart';
import 'package:phrazer_new/styles/colors.dart';
import 'package:provider/provider.dart';

class EditCategory extends StatefulWidget {
  const EditCategory({Key key}) : super(key: key);

  @override
  _EditCategoryState createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  String _iconName = 'priority_high';
  bool _active = false;

  void _handleTap(String value) {
    setState(() {
      _active = true;
      _iconName = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Green,
          title: Text('Edit Category'),
          actions: <Widget>[
            FlatButton(
              child: Icon(Icons.check),
              textColor: Colors.white,
              onPressed: () {
                categoryProvider.saveCategory();
                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          color: DarkGreen,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    children: <Widget>[
                      CategoryListItem(
                          category_icons
                              .singleWhere((e) => e.name == _iconName)
                              .icon,
                          _active),
                      SizedBox(width: 20.0),
                      Flexible(
                        child: TextField(
                          style: TextStyle(color: LightGray),
                          decoration: InputDecoration(
                            hintText: 'Name',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Green),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Green),
                            ),
                          ),
                          onChanged: (value) {
                            categoryProvider.changeName(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(bottom: 15.0),
                  child: Center(
                    child: Text(
                      'choose the icon'.toUpperCase(),
                      style: TextStyle(
                          color: LightGray,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          child: CategoryListItem(
                              category_icons[index].icon, false),
                          onTap: () {
                            _handleTap(category_icons[index].name);
                            categoryProvider
                                .changeIcon(category_icons[index].name);
                          });
                    },
                    childCount: category_icons.length - 1,
                  )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.delete,
            color: Green,
          ),
          onPressed: () {},
          backgroundColor: LightGreen,
        ));
  }
}
