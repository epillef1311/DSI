// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_application_2/editWord.dart';
import 'package:flutter_application_2/repositorio.dart';
import 'package:flutter_application_2/buildRow.dart';

class RandomWords extends StatefulWidget {
  final Repositorio repositorio;

  const RandomWords({
    required this.repositorio,
    super.key,
  });
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  Widget _buildList() {
    return ListView.builder(
        itemCount: widget.repositorio.itemInList,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, item) {
          if (item.isOdd) return Divider();

          final index = item ~/ 2;

          return Buildrow(
            pair: widget.repositorio.randomWordsPairs[index],
            repositorio: widget.repositorio,
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        EditWord(repositorio: widget.repositorio)));
          },
          backgroundColor: Colors.red,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text('Word Pair Genenrator'),
          actions: <Widget>[
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/Pushcard'),
                icon: Icon(Icons.toggle_off)),
            IconButton(
                icon: Icon(Icons.list),
                onPressed: () => Navigator.pushNamed(context, '/PushSaved'))
          ],
        ),
        body: _buildList());
  }
}
