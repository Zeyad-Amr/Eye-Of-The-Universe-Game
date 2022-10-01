import 'package:client/cards/filpped_cards.dart';
import 'package:client/discovery/discoveryData.dart';
import 'package:client/discovery/disovery.dart';
import 'package:client/puzzle.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Data data = Data();
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
                    builder: (context) => Discovery(data: data.data[0]),
                  ),
                );
              },
              child: const Text(
                "Discovery",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PuzzleWidget(
                      gridSize: 2,
                      timeInSec: 20,
                      img: data.data[0]['jwst'],
                      title: data.data[0]['image'],
                      description: data.data[0]['description'],
                    ),
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
                    builder: (context) => const FlippedCards(size: 3),
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
