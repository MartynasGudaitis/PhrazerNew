import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phrazer_new/models/category.dart';
import 'package:phrazer_new/services/firestore_service.dart';
import 'package:uuid/uuid.dart';

class CategoryProvider with ChangeNotifier {
  final firestoreService = FirestoreService();

  String _categoryId;
  String _name;
  String _icon;
  var uuid = Uuid();

  //Getters
  String get name => _name;
  String get icon => _icon;

  //Setters
  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changeIcon(String value) {
    _icon = value;
    notifyListeners();
  }

  saveCategory() {
    var newCategory = Category(name: name, icon: icon, categoryId: uuid.v4());
    firestoreService.saveCategory(newCategory);
  }
}