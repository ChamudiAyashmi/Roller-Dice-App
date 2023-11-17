import 'package:flutter/material.dart';
import 'package:my_flutter_application/roller_dice.dart';

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({Key? key, required this.colors, required this.playerOneName, required this.playerTwoName}) : super(key: key);
  
  final List<Color> colors;
  final String playerOneName;
  final String playerTwoName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Roller Dice App'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: beginAlignment,
            end: endAlignment,
            colors: colors,
          ),
        ),
        child: Center(
          child: RollerDice(
            playerOneName: playerOneName,
            playerTwoName: playerTwoName,
          ),
        ),
      ),
    );
  }
}
