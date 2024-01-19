import 'package:flutter/material.dart';
import 'package:wordle/utils/game_provider.dart';
import 'package:wordle/widets/game_keyboard.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  WordleGame _game = WordleGame();
  // late String word;

  @override
  void initState() {
    super.initState();
    WordleGame.initGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Wordle",
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          //structure
          GameKeyboard(_game),
        ],
      ),
    );
  }
}
