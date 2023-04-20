import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class Repositorio {
  List<WordPair> randomWordsPairs = <WordPair>[];
  final savedWordPairs = Set<WordPair>();
  int itemInList = 40;

  Repositorio() {
    this.randomWordsPairs.addAll(generateWordPairs().take(20));
  }

  AddItemInList() {
    itemInList = itemInList + 2;
  }

  AddWorPair(wordpair) {
    randomWordsPairs.add(wordpair);
  }
}
