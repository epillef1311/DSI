// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_2/pushCard.dart';
import 'package:flutter_application_2/pushSaved.dart';
import './random_words.dart';
import 'package:flutter_application_2/repositorio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Repositorio repositorio = Repositorio();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.light().copyWith(primary: Colors.red)),
      initialRoute: '/',
      routes: {
        '/': (context) => RandomWords(
              repositorio: repositorio,
            ),
        '/Pushcard': (context) => PushCard(
              repositorio: repositorio,
            ),
        '/PushSaved': (context) => PushSaved(repositorio: repositorio)
      },
    );
  }
}
