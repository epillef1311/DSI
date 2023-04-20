import 'package:english_words/english_words.dart';

class Repositorio {
  final randomWordsPairs = <WordPair>[];
  final savedWordPairs = Set<WordPair>();

  Repositorio() {
    this.randomWordsPairs.addAll(generateWordPairs().take(20));
  }
}
