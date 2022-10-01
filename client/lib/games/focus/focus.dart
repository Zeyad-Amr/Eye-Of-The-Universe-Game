import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FocusWidget extends StatefulWidget {
  const FocusWidget({
    super.key,
  });

  @override
  State<FocusWidget> createState() => _FocusWidgetState();
}

class _FocusWidgetState extends State<FocusWidget> {
  String focusSelected = "";
  String filterSelected = "";
  Map<String, dynamic> itemSelected = {};
  List<Map<String, dynamic>> process = [
    {
      "inst": "NIRcam",
      "filter": ["F200W", "F210M", "F212N", "F444W"],
      'path': "assets/inst/nircam.jpg",
    },
    {
      "inst": "NIRISS",
      "filter": ["F200W", "F380M", "F444W"],
      'path': "assets/inst/Spectrometer.png",
    },
    {
      "inst": "NIRSPEC",
      "filter": ["F110W"],
      'path': "assets/inst/nirspec.jpg",
    },
    {
      "inst": "MIRI",
      "filter": ["F1000W"],
      'path': "assets/inst/miri.jpg",
    },
    {
      "inst": "FGS",
      "filter": ["FGS"],
      'path': "assets/inst/fgs.jpg",
    },
  ];
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
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Select Instrument to adjust your Telescope",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: process.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2.0,
                      mainAxisSpacing: 2.0,
                      childAspectRatio: 2 / 2),
                  padding: const EdgeInsets.all(16.0),
                  itemBuilder: (context, i) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          focusSelected = process[i]['inst'];
                          itemSelected = process[i];
                        });
                      },
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            side: focusSelected != process[i]['inst']
                                ? const BorderSide(width: 3, color: Colors.grey)
                                : const BorderSide(
                                    width: 5, color: Colors.blue),
                            borderRadius: BorderRadius.circular(15)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.asset(
                          process[i]['path'],
                          fit: BoxFit.cover,
                          // width: MediaQuery.of(context).size.width * 0.3,
                          // height: MediaQuery.of(context).size.width * 0.15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: itemSelected['filter']?.length ?? 0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2.0,
                      mainAxisSpacing: 2.0,
                      childAspectRatio: 2 / 2),
                  padding: const EdgeInsets.all(16.0),
                  itemBuilder: (context, i) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          filterSelected = itemSelected['filter'][i];
                        });
                      },
                      child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              side: filterSelected != itemSelected['filter'][i]
                                  ? const BorderSide(
                                      width: 3, color: Colors.grey)
                                  : const BorderSide(
                                      width: 5, color: Colors.blue),
                              borderRadius: BorderRadius.circular(15)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Container(
                            color: Colors.grey,
                            child:
                                Center(child: Text(itemSelected['filter'][i])),
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
