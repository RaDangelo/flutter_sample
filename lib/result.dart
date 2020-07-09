import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetHandler;

  Result(this.score, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (this.score <= 10) {
      resultText = 'You are awesome!';
    } else if (this.score <= 12) {
      resultText = 'You are likeable!';
    } else {
      resultText = 'You are... strange?!';
    }

    resultText += ' You scored ' + this.score.toString() + ' points!';

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            this.resultPhrase,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
              child: Text('Restart Quiz!'),
              textColor: Colors.blue,
              onPressed: this.resetHandler),
        ],
      ),
    );
  }
}
