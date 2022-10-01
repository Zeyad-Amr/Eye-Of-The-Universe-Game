import 'package:client/provider/filpped_cards.dart';
import 'package:client/puzzle.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PuzzleWidget(
                        gridSize: 2,
                        timeInSec: 20,
                        title: 'End Game',
                        description: 'Are you sure you want to end the game?'),
                  ),
                );
              },
              child: const Text(
                "Start Puzzle",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FlippedCards(),
                  ),
                );
              },
              child: const Text(
                "Start flipped cards",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
