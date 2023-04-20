import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_2/repositorio.dart';
import 'package:english_words/english_words.dart';

class PushSaved extends StatefulWidget {
  final Repositorio repositorio;
  const PushSaved({required this.repositorio, super.key});

  @override
  State<PushSaved> createState() => _PushSavedState();
}

class _PushSavedState extends State<PushSaved> {
  @override
  Widget build(BuildContext context) {
    final Iterable<ListTile> tiles =
        widget.repositorio.savedWordPairs.map((WordPair pair) {
      return ListTile(
          title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16.0)));
    });
    final List<Widget> divided =
        ListTile.divideTiles(context: context, tiles: tiles).toList();
    return Scaffold(
      appBar: AppBar(title: Text('Saved Word Pairs')),
      body: ListView(children: divided),
    );
  }
}
