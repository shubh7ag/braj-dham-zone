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

  // 🔥 Match detection function
  List<List<bool>> findMatches() {
    List<List<bool>> matches =
        List.generate(gridSize, (_) => List.filled(gridSize, false));

    // Horizontal check
    for (int row = 0; row < gridSize; row++) {
      for (int col = 0; col < gridSize - 2; col++) {
        int current = board[row][col];
        if (current == board[row][col + 1] &&
            current == board[row][col + 2]) {
          matches[row][col] = true;
          matches[row][col + 1] = true;
          matches[row][col + 2] = true;
        }
      }
    }

    // Vertical check
    for (int col = 0; col < gridSize; col++) {
      for (int row = 0; row < gridSize - 2; row++) {
        int current = board[row][col];
        if (current == board[row + 1][col] &&
            current == board[row + 2][col]) {
          matches[row][col] = true;
          matches[row + 1][col] = true;
          matches[row + 2][col] = true;
        }
      }
    }

    return matches;
  }

  // 🔥 Remove matched tiles
  int removeMatches(List<List<bool>> matches) {
    int removed = 0;
    Random random = Random();

    for (int row = 0; row < gridSize; row++) {
      for (int col = 0; col < gridSize; col++) {
        if (matches[row][col]) {
          board[row][col] = random.nextInt(6);
          removed++;
        }
      }
    }

    return removed;
  }
}
