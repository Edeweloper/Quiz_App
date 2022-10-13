import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text': 'Mouse', 'score': 10},
        {'text': 'Bee', 'score': 5},
        {'text': 'Dog', 'score': 3},
        {'text': 'Cat', 'score': 1},
      ],
    },
    {
      'questionText': 'Who is your favorite singer?',
      'answers': [
        {'text': 'Selena', 'score': 10},
        {'text': 'Beyonce', 'score': 5},
        {'text': 'Rihanna', 'score': 3},
        {'text': 'Ariana', 'score': 1},
      ],
    },
  ];
  var _questionsIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
        _questionsIndex = 0;
        _totalScore = 0;
    });
  
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;
    _totalScore += score;
    if (_questionsIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more question!');
    }
    setState(() {
      _questionsIndex = _questionsIndex + 1;
    });

    print(_questionsIndex);
  }

  @override
  Widget build(BuildContext context) {
    //question[]; does not work if question is a const
    // TODO: implement'What is your favorite animal?' build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My First App')),
        body: _questionsIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionsIndex: _questionsIndex,
                questions: _questions,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
