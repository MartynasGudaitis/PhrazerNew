import 'package:flutter/material.dart';
import 'package:phrazer_new/components/create_float_btn.dart';
import 'package:phrazer_new/models/category.dart';
import 'package:phrazer_new/screens/phrases_page.dart';
import 'package:provider/provider.dart';
import '../sign_in.dart';
import '../styles/colors.dart';
import '../components/singout_dialog.dart';
import '../components/category_card.dart';
import '../components/greeting.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<List<Category>>(context);
    return Scaffold(
        appBar: AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'assets/images/phrazer.png',
                  fit: BoxFit.cover,
                  height: 30.0,
                )
              ]),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.all(12.0),
              icon: Icon(Icons.search),
              onPressed: () {},
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
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          color: DarkGreen,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.only(top: 42.0),
                  child: Greeting(),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.only(left: 15.0, bottom: 15.0),
                  child: Text('My Categories'.toUpperCase(),
                      style: Theme.of(context).textTheme.body2),
                ),
              ),
              (categories != null)
                  ? SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            child: CategoryCard(
                                categories[index].name, categories[index].icon),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PhrasesPage(
                                      categoryId: categories[index].categoryId,
                                      title: categories[index].name)));
                            },
                          );
                        },
                        childCount: categories.length,
                      ))
                  : SliverToBoxAdapter(
                      child: CircularProgressIndicator(),
                    )
            ],
          ),
        ),
        floatingActionButton: CreateFloatingButton());
  }
}
