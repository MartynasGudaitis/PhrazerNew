import 'package:flutter/material.dart';
import 'package:phrazer_new/styles/colors.dart';

class CategoryListItem extends StatelessWidget {
  String _name;
  IconData _icon;
  bool _status = false;

  CategoryListItem(this._icon, [this._status, this._name]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
            radius: 25,
            backgroundColor: (_status) ? Orange : LightGreen,
            child: IconButton(
              icon: Icon(
                _icon,
                color: (_status) ? LightGray : Green,
              ),
            )),
        (_name != null)
            ? Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  _name,
                  style: TextStyle(color: Green),
                ),
              )
            : Container(),
      ],
    );
  }
}

/*
  FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {},
      backgroundColor: Orange,
    );
 */