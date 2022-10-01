import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Discovery extends StatefulWidget {
  final Map<String, dynamic> data;
  const Discovery({super.key, required this.data});

  @override
  State<Discovery> createState() => _DiscoveryState();
}

class _DiscoveryState extends State<Discovery> {
  int teleSelected = 0;
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
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Select Telescope to discover\n${widget.data['image']}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      teleSelected = 1;
                    });
                  },
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        side: teleSelected != 1
                            ? const BorderSide(width: 3, color: Colors.grey)
                            : const BorderSide(width: 5, color: Colors.blue),
                        borderRadius: BorderRadius.circular(15)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset(
                      "assets/james.gif",
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.width * 0.4,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      teleSelected = 2;
                    });
                  },
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        side: teleSelected != 2
                            ? const BorderSide(width: 3, color: Colors.grey)
                            : const BorderSide(width: 5, color: Colors.blue),
                        borderRadius: BorderRadius.circular(15)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset(
                      "assets/hubble.gif",
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.width * 0.4,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PhotoView(
                          imageProvider: AssetImage(widget
                              .data[teleSelected == 1 ? 'jwst' : 'hubble']),
                        ),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15)),
                    child: const Text(
                      "Discover",
                      style: TextStyle(fontSize: 25),
                    ),
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
