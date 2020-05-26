import 'package:flutter/foundation.dart';
import 'package:phrazer_new/models/phrase.dart';
import 'package:phrazer_new/services/firestore_service.dart';
import 'package:uuid/uuid.dart';

class PhraseProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _phraseId;
  String _phrase;
  String _translation;
  String _categoryId;
  var uuid = Uuid();

  //Getters
  String get phrase => _phrase;
  String get translation => _translation;
  String get categoryId => _categoryId;

  //Setters
  changePhrase(String value) {
    _phrase = value;
    notifyListeners();
  }

  changeTranslation(String value) {
    _translation = value;
    notifyListeners();
  }

  changeCategoryId(String value) {
    _categoryId = value;
    notifyListeners();
  }

  loadValues(Phrase phrase) {
    _phraseId = phrase.phraseId;
    _phrase = phrase.phrase;
    _translation = phrase.translation;
  }

  savePhrase() {
    var newPhrase = Phrase(
        phraseId: (_phraseId == null) ? uuid.v4() : _phraseId,
        phrase: phrase,
        translation: translation,
        categoryId: categoryId);
    firestoreService.savePhrase(newPhrase);
  }

  countMatch(String value, List<Phrase> phrases) {
    int _itemCount = 0;
    phrases.forEach(
        (phrase) => (phrase.categoryId == value) ? _itemCount++ : null);
    return _itemCount;
  }

  removePhrase(String phraseId) {
    firestoreService.removePhrase(phraseId);
  }
}
