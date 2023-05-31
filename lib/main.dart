import 'package:cat_trivia/ui/fact_history_screen.dart';
import 'package:cat_trivia/ui/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Facts',
      initialRoute: '/',
      routes: {
        '/': (_) => MainScreen(),
        '/fact-history': (_) => FactHistoryScreen(),
      },
    );
  }
}





