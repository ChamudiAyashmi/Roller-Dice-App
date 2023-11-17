import 'package:flutter/material.dart';
import 'package:my_flutter_application/home.dart';

class RollerDiceApp extends StatelessWidget {
  const RollerDiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.pink,
          title: const Text('Roller Dice App'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/backgroundImage.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: const Column(
            children: [
              Center(
                child: Home(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
