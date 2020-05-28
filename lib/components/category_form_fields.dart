import 'package:flutter/material.dart';
import 'package:phrazer_new/components/category_list_item.dart';
import 'package:phrazer_new/components/toast_message.dart';
import 'package:phrazer_new/providers/category_provider.dart';
import 'package:phrazer_new/styles/colors.dart';

import 'not_selected_dialog.dart';

Widget buildCategoryFormInputField(
    TextEditingController controller, String label, CategoryProvider provider) {
  return Flexible(
    child: Container(
      margin: EdgeInsets.only(top: 20),
      child: TextFormField(
        cursorColor: Green,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(labelText: label),
        controller: controller,
        maxLength: 20,
        style: TextStyle(color: LightGray),
        validator: (String value) {
          if (value.isEmpty) {
            return label + ' is Required';
          }
          return null;
        },
        onSaved: (String value) {
          provider.changeName(value);
        },
      ),
    ),
  );
}

Widget buildCategoryFormSaveButton(BuildContext context, String message,
    CategoryProvider provider, GlobalKey<FormState> formKey, bool activeIcon) {
  return GestureDetector(
    child: Container(
        child: FlatButton(
      child: Icon(Icons.check),
      textColor: Colors.white,
      onPressed: () {
        if (!formKey.currentState.validate()) {
          return;
        } else if (!activeIcon) {
          notSelectedDialog(context, 'Category icon is required');
          return;
        }
        formKey.currentState.save();
        provider.saveCategory();
        Navigator.of(context).pop();
        toastMessage(context, message);
      },
    )),
  );
}

class CategoryIconField extends FormField<String> {
  CategoryIconField({
    String initialValue,
    FormFieldSetter<String> onSaved,
    FormFieldValidator<String> validator,
  }) : super(
            autovalidate: false,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue ?? List(),
            builder: (state) {
              return CategoryIconFieldState(state);
            });
}

class CategoryIconFieldState extends StatelessWidget {
  FormFieldState<String> state;
  CategoryIconFieldState(this.state);

  @override
  Widget build(BuildContext context) {
    return CategoryListItem(
        Icons.priority_high); //The Widget(s) to build your form field
  }
}
