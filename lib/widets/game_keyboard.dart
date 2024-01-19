import 'package:flutter/material.dart';
import 'package:wordle/utils/game_provider.dart';
import 'package:wordle/widets/game_board.dart';

class GameKeyboard extends StatefulWidget {
  GameKeyboard(this.game, {Key? key}) : super(key: key);
  WordleGame game;
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
        Text(
          WordleGame.game_message,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 20.0),
        GameBoard(widget.game), // <--- this is the blank boxes
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row1.map((e) {
            //THE GAME LOGIC TAPPING IS IN MAIN HEREJ
            return InkWell(
              onTap: () {
                print(e);
                // we weill add here the game logic keyboard
                if (widget.game.letterId < 5) {
                  setState(() {
                    widget.game.insertWord(widget.game.letterId, Letter(e, 0));
                    widget.game.letterId++;
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey.shade300,
                ),
                child: Text(
                  "$e",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row2.map((e) {
            return InkWell(
              onTap: () {
                print(e);
                // we weill add here the game logic keyboard
                if (widget.game.letterId < 5) {
                  setState(() {
                    widget.game.insertWord(widget.game.letterId, Letter(e, 0));
                    widget.game.letterId++;
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey.shade300,
                ),
                child: Text(
                  "$e",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row3.map((e) {
            return InkWell(
              onTap: () {
                print(e);
                // we weill add here the game logic keyboard
                if (e == "DEL") {
                  //create the delete funcition
                  if (widget.game.letterId > 0) {
                    setState(() {
                      widget.game
                          .insertWord(widget.game.letterId - 1, Letter("", 0));
                      widget.game.letterId--;
                    });
                  }
                } else if (e == "SUBMIT") {
                  //setting tje game rules
                  if (widget.game.letterId >= 5) {
                    String guess = widget.game.wordleBoard[widget.game.rowId]
                        .map((e) => e.letter)
                        .join();
                    if (widget.game.checkWordExist(guess)) {
                      if (guess == WordleGame.game_guess) {
                        setState(() {
                          WordleGame.game_message = "Congratulations ";
                          widget.game.wordleBoard[widget.game.rowId]
                              .forEach((element) {
                            element.code = 1;
                          });
                        });
                      }
                    }
                  }
                } else {
                  if (widget.game.letterId < 5) {
                    setState(() {
                      widget.game
                          .insertWord(widget.game.letterId, Letter(e, 0));
                      widget.game.letterId++;
                    });
                  }
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey.shade300,
                ),
                child: Text(
                  "$e",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
