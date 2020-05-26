import 'package:flutter/material.dart';
import 'package:phrazer_new/components/category_delete_dialog.dart';
import 'package:phrazer_new/components/category_form_fields.dart';
import 'package:phrazer_new/components/category_list_item.dart';
import 'package:phrazer_new/components/toast_message.dart';
import 'package:phrazer_new/models/category.dart';
import 'package:phrazer_new/models/category_icon.dart';
import 'package:phrazer_new/providers/category_provider.dart';
import 'package:phrazer_new/styles/colors.dart';
import 'package:provider/provider.dart';

class EditCategory extends StatefulWidget {
  final Category category;

  EditCategory({Category this.category});

  @override
  _EditCategoryState createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  String _iconName;
  String toastMessage = 'Category successfully created';
  bool active = false;
  // Controllers
  final nameController = TextEditingController();

  // Need to add icon controller probably

  @override
  void dispose() {
    nameController.dispose();
    // Need to add dispose for iconController
    super.dispose();
  }

  @override
  void initState() {
    if (widget.category == null) {
      // New Category
      nameController.text = '';
      _iconName = 'priority_high';
      //Update State
      new Future.delayed(Duration.zero, () {
        final categoryProvider =
            Provider.of<CategoryProvider>(context, listen: false);
        categoryProvider.loadValues(Category());
      });
    } else {
      // Existing Category
      active = true;
      // Update controllers
      nameController.text = widget.category.name;
      _iconName = widget.category.icon;
      //Update State
      new Future.delayed(Duration.zero, () {
        final categoryProvider =
            Provider.of<CategoryProvider>(context, listen: false);
        categoryProvider.loadValues(widget.category);
      });
      toastMessage = 'Category successfully updated';
    }
    super.initState();
  }

  void _handleTap(String value) {
    setState(() {
      active = true;
      _iconName = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          title: Text(
              (widget.category == null) ? 'New Category' : 'Edit Category'),
          actions: <Widget>[
            buildCategoryFormSaveButton(
                context, toastMessage, categoryProvider, formKey, active),
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
                    child: Form(
                      key: formKey,
                      child: Row(
                        children: <Widget>[
                          //CategoryIconField(),
                          CategoryListItem(
                              category_icons
                                  .singleWhere((e) => e.name == _iconName)
                                  .icon,
                              active),
                          SizedBox(width: 20.0),
                          buildCategoryFormInputField(
                              nameController, 'Name', categoryProvider),
                        ],
                      ),
                    )),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(bottom: 15.0),
                  child: Center(
                    child: Text(
                      'choose the icon'.toUpperCase(),
                      style: Theme.of(context).textTheme.body2,
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
        floatingActionButton: (widget.category != null)
            ? FloatingActionButton(
                backgroundColor: LightGray,
                child: Icon(
                  Icons.delete,
                  color: Green,
                ),
                onPressed: () {
                  categoryDeleteDialog(context, widget.category.categoryId);
                },
              )
            : null);
  }
}
