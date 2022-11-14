import 'dart:io';

import 'package:aircare/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:lottie/lottie.dart';

class SleepDetection extends StatefulWidget {
  const SleepDetection({Key? key}) : super(key: key);

  @override
  State<SleepDetection> createState() => _SleepDetectionState();
}

class _SleepDetectionState extends State<SleepDetection> {
  // FirebaseDatabase database = FirebaseDatabase.instance;
  // DatabaseReference ref =
  //     FirebaseDatabase.instance.ref("activity");
  String displayText = 'Detecting...';
  bool detected = false;
  final _database = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    activateListeners();
  }

  void activateListeners() {
    print('hiii');
    _database
        .child('sleep/-NGqvdfK_1Zal2b_ueAi')
        .onValue
        .listen((DatabaseEvent event) {
      final activity = event.snapshot.value;
      final fetchedData = Map<String, dynamic>.from(activity as dynamic);
      setState(() {
        displayText = fetchedData['detected'];
        if (displayText == 'sleeping') {
          detected = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final setActivity = _database.child('sleep/-NGqvdfK_1Zal2b_ueAi');
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            Color.fromARGB(255, 165, 155, 219),
            Color.fromARGB(255, 181, 228, 196),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('Sleep Detection'),
        ),
        body: SafeArea(
            child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: detected
                    ? Lottie.asset('aseets/images/sleeping_blue.json',
                        height: 250)
                    : Container(),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 71, 133),
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20,
                        ),
                        child: Text(
                          displayText,
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        )),
                    // ElevatedButton(
                    //   onPressed: () async {
                    //     try {
                    //       setActivity.set({'detected': 'Normal'});
                    //       setState(() {
                    //         detected = false;
                    //       });
                    //       print('added');
                    //     } catch (e) {
                    //       print('error $e');
                    //     }
                    //   },
                    //   child: Text('OKAY'),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
