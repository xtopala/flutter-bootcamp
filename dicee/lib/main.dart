import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var leftDice = 5;

    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice$leftDice.png'),
              onPressed: () {
                print('Dice 1');
              },
            ),
          ),
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice5.png'),
              onPressed: () {
                print('Dice 2');
              },
            ),
          )
        ],
      ),
    );
  }
}
