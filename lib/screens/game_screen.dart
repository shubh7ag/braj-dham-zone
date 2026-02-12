import 'package:flutter/material.dart';
import '../game/board.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final GameBoard gameBoard = GameBoard();
  int score = 0;

  int? selectedRow;
  int? selectedCol;

  Color getTileColor(int value) {
    List<Color> colors = [
      Colors.orange,
      Colors.pink,
      Colors.blue,
      Colors.green,
      Colors.purple,
      Colors.yellow,
    ];
    return colors[value];
  }

  void onTileTap(int row, int col) {
    setState(() {
      if (selectedRow == null) {
        selectedRow = row;
        selectedCol = col;
      } else {
        // Swap tiles
        int temp = gameBoard.board[row][col];
        gameBoard.board[row][col] =
            gameBoard.board[selectedRow!][selectedCol!];
        gameBoard.board[selectedRow!][selectedCol!] = temp;

        selectedRow = null;
        selectedCol = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade900,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("BRAJ DHAM - Radhe Radhe 🙏"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            "Score: $score",
            style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: GameBoard.gridSize,
              ),
              itemCount: GameBoard.gridSize * GameBoard.gridSize,
              itemBuilder: (context, index) {
                int row = index ~/ GameBoard.gridSize;
                int col = index % GameBoard.gridSize;

                bool isSelected =
                    row == selectedRow && col == selectedCol;

                return GestureDetector(
                  onTap: () => onTileTap(row, col),
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: getTileColor(gameBoard.board[row][col]),
                      borderRadius: BorderRadius.circular(8),
                      border: isSelected
                          ? Border.all(color: Colors.white, width: 3)
                          : null,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
