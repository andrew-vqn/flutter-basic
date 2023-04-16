import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);
  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore >= 30) {
      resultText = 'Passed';
    } else {
      resultText = 'Failed!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultPhrase,
          style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          child: const Text('Reset quiz'),
          onPressed: () {
            resetHandler();
          },
        )
      ],
    ));
  }
}
