import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
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

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = getRandomDice();
  int rightDiceNumber = getRandomDice();

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = getRandomDice();
      rightDiceNumber = getRandomDice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice$leftDiceNumber.png'),
              onPressed: changeDiceFace,
            ),
          ),
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice$rightDiceNumber.png'),
              onPressed: changeDiceFace,
            ),
          ),
        ],
      ),
    );
  }
}

int getRandomDice() {
  return Random().nextInt(6) + 1;
}
