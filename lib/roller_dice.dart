import 'dart:math';
import 'package:flutter/material.dart';

class RollerDice extends StatefulWidget {
  const RollerDice(
      {Key? key, required this.playerOneName, required this.playerTwoName})
      : super(key: key);

  final String playerOneName;
  final String playerTwoName;

  @override
  State<RollerDice> createState() => _RollerDiceState();
}

class _RollerDiceState extends State<RollerDice> {
  var diceNumber = 1;
  List<int> playerOne = [];
  List<int> playerTwo = [];
  int playerOneDiceValue = 0;
  int playerTwoDiceValue = 0;
  int roundCounter = 0;
  bool isDisableBtnPlayerOne = false;
  bool isDisableBtnPlayerTwo = false;
  int totalDiceValueOfPlayerOne = 0;
  int totalDiceValueOfPlayerTwo = 0;

  void roll1() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
      playerOne.add(diceNumber);
      playerOneDiceValue = diceNumber;
      isDisableBtnPlayerOne = true;
      isDisableBtnPlayerTwo = false;
    });
  }

  void roll2() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
      playerTwo.add(diceNumber);
      playerTwoDiceValue = diceNumber;
      isDisableBtnPlayerTwo = true;
      isDisableBtnPlayerOne = false;
    });
  }

  void displayMessage() {
    roundCounter++;
    if (roundCounter < 5) {
    } else {
      totalDiceValueOfPlayerOne =
          playerOne.reduce((value, element) => value + element);
      totalDiceValueOfPlayerTwo =
          playerTwo.reduce((value, element) => value + element);

      String message;

      if (totalDiceValueOfPlayerOne > totalDiceValueOfPlayerTwo) {
        message = '${widget.playerOneName} Won the Game!';
      } else if (totalDiceValueOfPlayerOne < totalDiceValueOfPlayerTwo) {
        message = '${widget.playerTwoName} Won the Game!';
      } else {
        message = 'It\'s a Tie!';
      }

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Game Over'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      resetGame();
    }
  }

  void resetGame() {
    setState(() {
      roundCounter = 0;
      playerOne.clear();
      playerTwo.clear();
      playerOneDiceValue = 0;
      playerTwoDiceValue = 0;
      isDisableBtnPlayerOne = false;
      isDisableBtnPlayerTwo = false;
      totalDiceValueOfPlayerOne = 0;
      totalDiceValueOfPlayerTwo = 0;
    });
  }

  void updateTotalDiceValueOfPlayerOne() {
    totalDiceValueOfPlayerOne =
        playerOne.reduce((value, element) => value + element);
  }

  void updateTotalDiceValueOfPlayerTwo() {
    totalDiceValueOfPlayerTwo =
        playerTwo.reduce((value, element) => value + element);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${widget.playerOneName} : $totalDiceValueOfPlayerOne',
          style: const TextStyle(fontSize: 25, color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          '${widget.playerTwoName} : $totalDiceValueOfPlayerTwo',
          style: const TextStyle(fontSize: 25, color: Colors.white),
        ),
        const SizedBox(height: 30),
        Image.asset(
          'assets/images/dice-$diceNumber.png',
          width: 150,
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          children: [
            const SizedBox(
              width: 28,
            ),
            TextButton(
              onPressed: isDisableBtnPlayerOne
                  ? null
                  : () {
                      roll1();
                      updateTotalDiceValueOfPlayerOne();
                    },
              style: TextButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 25),
              ),
              child: const Text('Player One'),
            ),
            const SizedBox(
              width: 20,
            ),
            TextButton(
              onPressed: isDisableBtnPlayerTwo
                  ? null
                  : () {
                      roll2();
                      updateTotalDiceValueOfPlayerTwo();
                      displayMessage();
                    },
              style: TextButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 25),
              ),
              child: const Text('Player Two'),
            ),
          ],
        ),
      ],
    );
  }
}
