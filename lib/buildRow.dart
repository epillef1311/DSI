import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_2/editWord.dart';
import 'package:flutter_application_2/repositorio.dart';

class Buildrow extends StatefulWidget {
  final Repositorio repositorio;
  final WordPair pair;
  const Buildrow({required this.pair, required this.repositorio, super.key});

  @override
  State<Buildrow> createState() => _BuildrowState();
}

class _BuildrowState extends State<Buildrow> {
  @override
  Widget build(BuildContext context) {
    final alreadySaved =
        widget.repositorio.savedWordPairs.contains(widget.pair);
    return ListTile(
      title: Text(
        widget.pair.asPascalCase,
        style: TextStyle(fontSize: 18.0),
      ),
      trailing: IconButton(
        icon: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null),
        onPressed: () {
          setState(() {
            if (alreadySaved) {
              widget.repositorio.savedWordPairs.remove(widget.pair);
            } else {
              widget.repositorio.savedWordPairs.add(widget.pair);
            }
          });
        },
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditWord(
                      pair: widget.pair,
                      repositorio: widget.repositorio,
                    )));
      },
    );
  }
}
