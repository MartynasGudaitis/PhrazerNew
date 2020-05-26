import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  String categoryId;
  String name;
  String icon;

  Category({this.categoryId, this.name, this.icon});

  Map<String, dynamic> toMap() {
    return {'categoryId': categoryId, 'name': name, 'icon': icon};
  }

  Category.documentsFromFirestore(Map<String, dynamic> firestore)
      : categoryId = firestore['categoryId'],
        name = firestore['name'],
        icon = firestore['icon'];
}
