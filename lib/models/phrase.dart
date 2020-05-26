class Phrase {
  final String phraseId;
  final String phrase;
  final String translation;
  final String categoryId;

  Phrase({this.phraseId, this.phrase, this.translation, this.categoryId});

  Map<String, dynamic> toMap() {
    return {
      'phraseId': phraseId,
      'phrase': phrase,
      'translation': translation,
      'categoryId': categoryId
    };
  }

  Phrase.fromFirestore(Map<String, dynamic> firestore)
      : phraseId = firestore['phraseId'],
        phrase = firestore['phrase'],
        translation = firestore['translation'],
        categoryId = firestore['categoryId'];
}
