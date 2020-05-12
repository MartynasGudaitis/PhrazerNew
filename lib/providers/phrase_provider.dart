import 'package:flutter/foundation.dart';
import 'package:phrazer_new/models/phrase.dart';
import 'package:phrazer_new/services/firestore_service.dart';
import 'package:uuid/uuid.dart';

class PhraseProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _phraseId;
  String _phrase;
  String _translation;
  var uuid = Uuid();

  //Getters
  String get phrase => _phrase;
  String get translation => _translation;

  //Setters
  changePhrase(String value) {
    _phrase = value;
    notifyListeners();
  }

  changeTranslation(String value) {
    _translation = value;
    notifyListeners();
  }

  loadValues(Phrase phrase) {
    _phraseId = phrase.phraseId;
    _phrase = phrase.phrase;
    _translation = phrase.translation;
  }

  savePhrase() {
    if (_phraseId == null) {
      var newPhrase =
          Phrase(phraseId: uuid.v4(), phrase: phrase, translation: translation);
      firestoreService.savePhrase(newPhrase);
    } else {
      // Update
      var updatePhrase =
          Phrase(phraseId: _phraseId, phrase: phrase, translation: translation);
      firestoreService.savePhrase(updatePhrase);
    }
  }

  removePhrase(String phraseId) {
    firestoreService.removePhrase(phraseId);
  }
}
