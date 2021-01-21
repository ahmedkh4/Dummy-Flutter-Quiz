import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler ; 

  Result(this.resultScore , this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 18) {
      resultText = ' You are Cute ';
    } else if (resultScore <= 22) {
      resultText = ' You are Likeable ! ';
    } else if (resultScore <= 26) {
      resultText = ' You are Weird ! ';
    } else {
      resultText = ' You are a BadAss! ';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column( mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetHandler,
            child: Text('Reset Quiz'),
            textColor: Colors.blue[300],
          )
        ],
      ),
    );
  }
}
