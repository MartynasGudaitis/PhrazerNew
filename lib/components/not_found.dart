import 'package:flutter/material.dart';
import 'package:phrazer_new/styles/colors.dart';

class NotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 84.0),
            child: Text(
              'Phrases Not Found',
              style: Theme.of(context)
                  .textTheme
                  .title
                  .merge(TextStyle(color: Green)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 14.0),
            child: Text(
              'Inside this category',
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .merge(TextStyle(color: LightGray)),
            ),
          ),
          Container(
              padding: EdgeInsets.all(25.0),
              child: Image.asset('assets/images/not_found.png')),
          Container(
            margin: EdgeInsets.fromLTRB(50.0, 17.0, 50.0, 0.0),
            child: Text(
              'Click the orange add button bellow in order to create a new phrase for this category',
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .merge(TextStyle(color: LightGray)),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 162.0, top: 110.0),
            child: Transform.rotate(
              angle: 3.8,
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.reply,
                color: LightGray,
                size: 50,
              ),
            ),
          )
        ],
      ),
    );
  }
}
