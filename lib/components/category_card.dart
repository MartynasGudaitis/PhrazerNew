import 'package:flutter/material.dart';
import 'package:phrazer_new/models/category_icon.dart';
import 'package:phrazer_new/styles/colors.dart';

class CategoryCard extends StatelessWidget {
  final String _categoryName;
  final String _iconName;

  CategoryCard(this._categoryName, this._iconName);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: LightGreen,
        borderRadius: BorderRadius.circular(14.0),
      ),
      constraints: BoxConstraints(minWidth: 120.0, minHeight: 120.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              _categoryName,
              style: Theme.of(context).textTheme.subhead.merge(TextStyle(
                    color: Green,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 68.0, bottom: 10.0),
            child: Icon(
              //Icons.airplanemode_active,
              //_iconName,
              category_icons.singleWhere((e) => e.name == _iconName).icon,
              color: DarkGreen,
              size: 42.0,
            ),
          ),
        ],
      ),
    );
  }
}
