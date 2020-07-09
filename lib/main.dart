import 'package:flutter/material.dart';

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
        {'text': 'Black', 'score': 3},
        {'text': 'Red', 'score': 2},
        {'text': 'Green', 'score': 4},
        {'text': 'White', 'score': 5},
        {'text': 'Blue', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 1},
        {'text': 'Cow', 'score': 5},
        {'text': 'Cat', 'score': 2},
        {'text': 'Giraffe', 'score': 3},
        {'text': 'Elephant', 'score': 4},
      ]
    },
    {
      'questionText': 'Who\'s your favorite superhero?',
      'answers': [
        {'text': 'Superman', 'score': 1},
        {'text': 'Wonder-Woman', 'score': 2},
        {'text': 'Batman', 'score': 3},
        {'text': 'Batwoman', 'score': 5},
        {'text': 'The Flash', 'score': 4},
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
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
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
