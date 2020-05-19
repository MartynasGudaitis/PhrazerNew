class Category {
  final String categoryId;
  final String name;
  final String icon;

  Category({this.categoryId, this.name, this.icon});

  Map<String, dynamic> toMap() {
    return {'categoryId': categoryId, 'name': name, 'icon': icon};
  }

  Category.fromFirestore(Map<String, dynamic> firestore)
      : categoryId = firestore['categoryId'],
        name = firestore['name'],
        icon = firestore['icon'];
}
