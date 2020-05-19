class Phrase {
  final String phraseId;
  final String phrase;
  final String translation;

  Phrase({this.phraseId, this.phrase, this.translation});

  Map<String, dynamic> toMap() {
    return {'phraseId': phraseId, 'phrase': phrase, 'translation': translation};
  }

  Phrase.fromFirestore(Map<String, dynamic> firestore)
      : phraseId = firestore['phraseId'],
        phrase = firestore['phrase'],
        translation = firestore['translation'];
}
