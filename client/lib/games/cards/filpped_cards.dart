import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:client/games/cards/cards_game.dart';
import 'package:flutter/material.dart';

class FlippedCards extends StatefulWidget {
  final int size;
  const FlippedCards({Key? key, required this.size}) : super(key: key);

  @override
  State<FlippedCards> createState() => _FlippedCardsState();
}

class _FlippedCardsState extends State<FlippedCards> {
  //setting text style
  TextStyle whiteText = const TextStyle(color: Colors.white);
  bool hideTest = false;
  bool finished = false;
  final Game _game = Game();

  //game stats
  int tries = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _game.initGame(widget.size * 2, _game.cardss.sublist(0, (widget.size * 2)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.topSlide,
                        headerAnimationLoop: false,
                        dialogType: DialogType.warning,
                        showCloseIcon: true,
                        title: 'End Game',
                        desc: 'Are you sure you want to end the game?',
                        btnOkOnPress: () {
                          Navigator.of(context).pop();
                          // Navigator.of(context).pop();
                        },
                        btnCancelOnPress: () {
                          // Navigator.of(context).pop();
                        },
                        // btnOkIcon: Icons.celebration_rounded,
                        onDismissCallback: (type) {
                          debugPrint('Dialog Dissmiss from callback $type');
                        },
                      ).show();
                    },
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  Text(
                    "Tries ${tries ~/ 2}",
                    style: const TextStyle(fontSize: 18),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                        itemCount: _game.gameImg!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 16.0,
                          mainAxisSpacing: 16.0,
                        ),
                        padding: const EdgeInsets.all(16.0),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              debugPrint(_game.matchCheck.toString());
                              setState(() {
                                //incrementing the clicks
                                tries++;
                                _game.gameImg![index] = _game.cards_list[index];
                                _game.matchCheck
                                    .add({index: _game.cards_list[index]});
                                debugPrint(_game.matchCheck.first.toString());
                              });
                              if (_game.matchCheck.length == 2) {
                                if (_game.matchCheck[0].values.first['path'] ==
                                    _game.matchCheck[1].values.first['path']) {
                                  debugPrint("true");
                                  //incrementing the score
                                  score += 100;
                                  if (score / 100 == widget.size) {
                                    debugPrint(score.toString());
                                    debugPrint(widget.size.toString());
                                    setState(() {
                                      finished = true;
                                    });
                                  }
                                  AwesomeDialog(
                                    context: context,
                                    animType: AnimType.topSlide,
                                    headerAnimationLoop: false,
                                    dialogType: DialogType.info,
                                    showCloseIcon: true,
                                    title: _game
                                        .matchCheck[1].values.first['title'],
                                    desc: _game.matchCheck[1].values
                                        .first['description'],
                                    btnOkOnPress: () {},
                                    onDismissCallback: (type) {
                                      debugPrint(
                                          'Dialog Dissmiss from callback $type');
                                    },
                                  ).show();

                                  _game.matchCheck.clear();
                                } else {
                                  debugPrint("false");

                                  Future.delayed(
                                      const Duration(milliseconds: 500), () {
                                    debugPrint(_game.gameColors.toString());
                                    setState(() {
                                      _game.gameImg![
                                          _game.matchCheck[0].keys.first] = {
                                        'path': _game.hiddenCardpath,
                                        'title': 'title',
                                        'description': 'description'
                                      };
                                      _game.gameImg![
                                          _game.matchCheck[1].keys.first] = {
                                        'path': _game.hiddenCardpath,
                                        'title': 'title',
                                        'description': 'description'
                                      };
                                      _game.matchCheck.clear();
                                    });
                                  });
                                }
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFB46A),
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image:
                                      AssetImage(_game.gameImg![index]['path']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        })),
              ),
              finished
                  ? Column(children: [
                      Text(
                        finished ? "Congratualtions" : "",
                        style: const TextStyle(
                          fontSize: 25,
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
                          )),
                      const SizedBox(
                        height: 100,
                      )
                    ])
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
