import 'package:flutter/material.dart';
import 'package:quiz_App/answer.dart';
import 'package:quiz_App/quiz.dart';
import 'package:quiz_App/result.dart';

// Main
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0 ;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0 ;
    });
  }

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color ?',
      'answers': [{'text':'Black' , 'score':10}, {'text':'Red' , 'scoe':5}, {'text':'Green' , 'score':3 }, {'text':'White' , 'score':1}],
    },
    {
      'questionText': 'what\'s your favorite animal ?',
      'answers': [{'text':'Shark' , 'score':10}, {'text':'Lion' , 'score':5}, {'text':'Rabbit' , 'score':3}, {'text':'Dog' , 'score':1}],
    },
    {
      'questionText': 'who\'s your favorite Ninja ?',
      'answers': [{'text':'Madara' , 'score':10},{ 'text':'Itachi' , 'score':5},{ 'text':'Kakashi' , 'score':3},{'text': 'Naruto' , 'score':1}],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore+= score ; 
    setState(() {
      _questionIndex += 1;
      print(_questionIndex);
      if (_questionIndex < _questions.length) {
        print('we have more questions!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // variables

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(' Quiz App '),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore ,  _resetQuiz ),
      ),
    );
  }
}
