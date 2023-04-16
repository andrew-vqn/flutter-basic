import 'dart:ffi';

import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 8},
        {'text': 'Green', 'score': 1},
        {'text': 'White', 'score': 5}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 8},
        {'text': 'Elephant', 'score': 1},
        {'text': 'Lion', 'score': 5}
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'Tom', 'score': 8},
        {'text': 'Peter', 'score': 1},
        {'text': 'Marry', 'score': 5}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print(_questionIndex);
      print('More');
    }
  }
void _resetQuiz() {
  setState(() {
    _questionIndex = 0;
    _totalScore = 0;
  });
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Hello Flutter'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questions: _questions,
                  questionIndex: _questionIndex)
              : Result(_totalScore, _resetQuiz)), // Text('Hello Flutter!'),
    );
  }
}
