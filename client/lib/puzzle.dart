import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_jigsaw_puzzle/flutter_jigsaw_puzzle.dart';

class PuzzleWidget extends StatefulWidget {
  final int gridSize;
  final int timeInSec;
  final String title;
  final String description;
  const PuzzleWidget(
      {super.key,
      required this.gridSize,
      required this.timeInSec,
      required this.title,
      required this.description});

  @override
  State<PuzzleWidget> createState() => _PuzzleWidgetState();
}

class _PuzzleWidgetState extends State<PuzzleWidget> {
  CountdownTimerController? controller;
  final puzzleKey = GlobalKey<JigsawWidgetState>();
  int endTime = 0;
  bool gameOver = false;
  bool finished = false;

  @override
  void initState() {
    super.initState();
    endTime =
        DateTime.now().millisecondsSinceEpoch + (1000 * (widget.timeInSec + 4));
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
    Timer(const Duration(seconds: 3), () {
      generatePuzzle();
    });
  }

  void onEnd() {
    if (finished) {
      debugPrint("Congrats");
    } else {
      setState(() {
        gameOver = true;
      });
      debugPrint("Game Over");
    }
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  generatePuzzle() async {
    await puzzleKey.currentState!.generate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: gameOver
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          finished ? "Congrats" : "Game Over",
                          style: const TextStyle(
                            fontSize: 40,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15)),
                            child: const Text(
                              "Back to Journey",
                              style: TextStyle(fontSize: 20),
                            ))
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.topSlide,
                              headerAnimationLoop: false,
                              dialogType: DialogType.warning,
                              showCloseIcon: true,
                              title: widget.title,
                              desc: widget.description,
                              btnOkOnPress: () {
                                Navigator.of(context).pop();
                                // Navigator.of(context).pop();
                              },
                              btnCancelOnPress: () {
                                // Navigator.of(context).pop();
                              },
                              // btnOkIcon: Icons.celebration_rounded,
                              onDismissCallback: (type) {
                                debugPrint(
                                    'Dialog Dissmiss from callback $type');
                              },
                            ).show();
                          },
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: const Icon(Icons.arrow_back),
                          ),
                        ),
                        CountdownTimer(
                          endWidget: const Text(""),
                          controller: controller,
                          onEnd: onEnd,
                          endTime: endTime,
                          textStyle: const TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        Center(
                          child: JigsawPuzzle(
                            gridSize: widget.gridSize,
                            image: const AssetImage("assets/images/eu.jpg"),
                            onFinished: () {
                              // ignore: avoid_print
                              print('finished!');
                              setState(() {
                                finished = true;
                              });
                              controller!.dispose();
                              AwesomeDialog(
                                context: context,
                                animType: AnimType.topSlide,
                                headerAnimationLoop: false,
                                dialogType: DialogType.info,
                                showCloseIcon: true,
                                title: 'Demo',
                                desc:
                                    'Dialog description here Dialog description here Dialog description here Dialog description here Dialog description here Dialog description here Dialog description here Dialog description here Dialog description here Dialog description here Dialog description here Dialog description here Dialog description here Dialog description here Dialog description here Dialog description here Dialog description here Dialog description here Dialog description here Dialog description here ',
                                btnOkOnPress: () {
                                  Navigator.of(context).pop();
                                  // Navigator.of(context).pop();
                                },

                                // btnOkIcon: Icons.celebration_rounded,
                                onDismissCallback: (type) {
                                  debugPrint(
                                      'Dialog Dissmiss from callback $type');
                                },
                              ).show();
                            },
                            snapSensitivity: .5, // Between 0 and 1
                            puzzleKey: puzzleKey,
                            onBlockSuccess: () {
                              // ignore: avoid_print
                              print('block success!');
                            },
                          ),
                        ),
                        Text(
                          finished ? "Congratualtions" : "",
                          style: const TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        finished
                            ? ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Back to Journey"))
                            : const SizedBox()
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
