import 'package:flutter/material.dart';
import 'package:my_flutter_application/gradient_container.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController playerOneController = TextEditingController();
  final TextEditingController playerTwoController = TextEditingController();

  void btnNewGameOnClick() {
    if (playerOneController.text.isEmpty || playerTwoController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Please Enter Two Names !'),
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
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GradientContainer(
            colors: const [
              Color.fromARGB(255, 228, 113, 104),
              Color.fromARGB(255, 228, 113, 104),
            ],
            playerOneName: playerOneController.text,
            playerTwoName: playerTwoController.text,
          ),
        ),
      );
    }
  }
  void clearTextFields(){
    playerOneController.text="";
    playerTwoController.text="";
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      const SizedBox(
        height: 20,
      ),
      TextField(
        controller: playerOneController,
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pink),
          ),
          hintText: 'Enter Player One Name :',
          hintStyle: TextStyle(color: Colors.white),
        ),
        style: const TextStyle(color: Colors.white),
      ),
      const SizedBox(
        height: 20,
      ),
      TextField(
        controller: playerTwoController,
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pink),
          ),
          hintText: 'Enter Player Two Name :',
          hintStyle: TextStyle(color: Colors.white),
        ),
        style: const TextStyle(color: Colors.white),
      ),
      const SizedBox(
        height: 250,
      ),
      TextButton(
          onPressed: btnNewGameOnClick,
          style: TextButton.styleFrom(
              backgroundColor: Colors.pink,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 25)),
          child: const Text('Play New Game'))
    ]);
  }
}
