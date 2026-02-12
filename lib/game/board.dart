import 'dart:math';

class GameBoard {
  static const int gridSize = 8;
  late List<List<int>> board;

  GameBoard() {
    generateBoard();
  }

  void generateBoard() {
    Random random = Random();
    board = List.generate(
      gridSize,
      (_) => List.generate(gridSize, (_) => random.nextInt(6)),
    );
  }
}
