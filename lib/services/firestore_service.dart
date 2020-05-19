import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phrazer_new/models/category.dart';
import 'package:phrazer_new/models/phrase.dart';

class FirestoreService {
  Firestore _db = Firestore.instance;

  // Phrase
  Future<void> savePhrase(Phrase phrase) {
    return _db
        .collection('phrases')
        .document(phrase.phraseId)
        .setData(phrase.toMap());
  }

  Stream<List<Phrase>> getPhrases() {
    return _db.collection('phrases').snapshots().map((snapshots) => snapshots
        .documents
        .map((document) => Phrase.fromFirestore(document.data))
        .toList());
  }

  Future<void> removePhrase(String phraseId) {
    return _db.collection('phrases').document(phraseId).delete();
  }

  // Category
  Future<void> saveCategory(Category category) {
    return _db
        .collection('categories')
        .document(category.categoryId)
        .setData(category.toMap());
  }

  Stream<List<Category>> getCategories() {
    return _db.collection('categories').snapshots().map((snapshots) => snapshots
        .documents
        .map((document) => Category.fromFirestore(document.data))
        .toList());
  }
}
