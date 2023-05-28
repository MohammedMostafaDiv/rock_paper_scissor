import 'dart:math';

import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

late int leftImage;
late int rightImage;
late int m;

late String grade;

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
    leftImage = Random().nextInt(3) + 1;
    rightImage = Random().nextInt(3) + 1;
    randMe();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: randMe,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink.shade300,
          title: const Text("Game"),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                width: 100,
                height: 100,
                child: TextButton(
                  onPressed: randMe,
                  child: Image.asset("images/re$m.jpg"),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                grade,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 100),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                        onPressed: randMe,
                        child: Image.asset("images/game$leftImage.jpg")),
                  ),
                  Expanded(
                    child: TextButton(
                        onPressed: randMe,
                        child: Image.asset("images/game$rightImage.jpg")),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "You",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "         System",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void randMe() {
    setState(() {
      leftImage = Random().nextInt(3) + 1;
      rightImage = Random().nextInt(3) + 1;
      if (leftImage == 3 && rightImage == 1) {
        m = 2;
        grade = "Winner";
      } else if (leftImage == 1 && rightImage == 3) {
        m = 2;
        grade = "Winner";
      } else if (leftImage == 3 && rightImage == 2) {
        m = 2;
        grade = "Winner";
      } else if (leftImage == rightImage) {
        m = 1;
        grade = "equality";
      } else {
        m = 3;
        grade = "Loser";
      }
    });
  }
}
