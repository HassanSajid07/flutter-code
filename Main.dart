import 'package:firstproject/result.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './question.dart';
import './answer.dart';

import './result.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  static const _questions = [
    {
      'questionText': 'what is your favourite colour ?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Green', 'score': 5},
        {'text': 'White', 'score': 7},
        {'text': 'Blue', 'score': 8},
      ],
    },
    {
      'questionText': 'what is your favourite animal ?',
      'answers': [
        {'text': 'Cat', 'score': 3},
        {'text': 'Dog', 'score': 4},
        {'text': 'Lion', 'score': 9},
        {'text': 'Dolphin', 'score': 11},
      ],
    },
    {
      'questionText': 'How did you like My app ?',
      'answers': [
        {'text': 'Good', 'score': 4},
        {'text': 'Better', 'score': 5},
        {'text': 'Excellent', 'score': 6},
        {'text': 'Bad', 'score': 0},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
       _questionIndex = 0;
    _totalScore = 0;
    });
   

  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('we have more Questions!');
    } else {
      print('No more Questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Quiz APP'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore , _resetQuiz),
      ),
    );
  }
}
