import 'dart:math';

class WordleGame {
  //lets set the variable of the app
  int rowId = 0;
  int letterId = 0;

  static String game_message = "";
  static String game_guess = "";
  static List<String> word_list = ["WORLD", "PUSSY", "FUDGE", "DODGE", "FUCKU"];
  static bool gameOver = false;

//setting the game row
  static List<Letter> wordleRow = List.generate(5, (index) => Letter("", 0));

  //setting the gameboard

  List<List<Letter>> wordleBoard =
      List.generate(5, (index) => List.generate(5, ((index) => Letter("", 0))));

  //setting game basic function
  static void initGame() {
    final random = new Random();
    int index = random.nextInt(word_list.length);
    game_guess = word_list[index];
  }

  //setting the game insertion
  void insertWord(index, word) {
    wordleBoard[rowId][index] = word;
  }

  bool checkWordExist(String word) {
    return word_list.contains(word);
  }
}

//LETTER CLASS
class Letter {
  String? letter;
  int code = 0;
  Letter(this.letter, this.code);
}
