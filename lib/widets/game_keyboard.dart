import 'package:flutter/material.dart';

class GameKeyboard extends StatefulWidget {
  const GameKeyboard({super.key});

  @override
  State<GameKeyboard> createState() => _GameKeyboardState();
}

class _GameKeyboardState extends State<GameKeyboard> {
  //game keyabord
  List row1 = "QWERTYUIOP".split("");
  List row2 = "ASDFGHJKL".split("");
  List row3 = ["DEL", "Z", "X", "C", "V", "B", "N", "M", "SUBMIT"];
  @override
  Widget build(BuildContext context) {
    return Column(
      //building keyboard
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row1.map((e) {
            return Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.shade300,
              ),
              child: Text(
                "$e",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
