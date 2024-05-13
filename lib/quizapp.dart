
import 'package:flutter/material.dart';
import 'quizscreen.dart';
class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor:
            const Color.fromRGBO(78, 7, 109, 1), // Set the background color to pink
      ),
      home: QuizScreen(),
    );
  }
}
