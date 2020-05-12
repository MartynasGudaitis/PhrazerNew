import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phrazer_new/models/phrase.dart';

class FirestoreService {
  Firestore _db = Firestore.instance;

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
}
