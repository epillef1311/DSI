import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_2/random_words.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_application_2/repositorio.dart';
import 'package:flutter_application_2/buildRow.dart';

class PushCard extends StatefulWidget {
  final Repositorio repositorio;
  const PushCard({required this.repositorio, super.key});

  @override
  State<PushCard> createState() => _PushCardState();
}

class _PushCardState extends State<PushCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Word Pair')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 8.0 / 10.0, crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          if (index >= widget.repositorio.randomWordsPairs.length) {
            widget.repositorio.randomWordsPairs
                .addAll(generateWordPairs().take(10));
          }
          return Padding(
              padding: EdgeInsets.all(5),
              child: Card(
                semanticContainer: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: Buildrow(
                      pair: widget.repositorio.randomWordsPairs[index],
                      repositorio: widget.repositorio,
                    ))
                  ],
                ),
              ));
        },
      ),
    );
  }
}
