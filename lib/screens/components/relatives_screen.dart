import 'dart:io';

import 'package:aircare/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:lottie/lottie.dart';

class RelativesDetection extends StatefulWidget {
  const RelativesDetection({Key? key}) : super(key: key);

  @override
  State<RelativesDetection> createState() => _RelativesDetectionState();
}

class _RelativesDetectionState extends State<RelativesDetection> {
  // FirebaseDatabase database = FirebaseDatabase.instance;
  // DatabaseReference ref =
  //     FirebaseDatabase.instance.ref("activity");
  String displayText = 'Detecting...';
  bool knownPerson = false;
  bool isNobody = false;
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
        .child('face/-NGpKItP-2ErOaLkKPUi')
        .onValue
        .listen((DatabaseEvent event) {
      final activity = event.snapshot.value;
      final fetchedData = Map<String, dynamic>.from(activity as dynamic);

      if (mounted) {
        setState(() {
          displayText = fetchedData['detected'];
          if (displayText == 'Random Person' || displayText == 'Nobody') {
            knownPerson = false;
            isNobody = false;
          } else {
            knownPerson = true;
            isNobody = false;
          }

          if (displayText == 'Nobody') {
            isNobody = true;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final setActivity = _database.child('face/-NGpKItP-2ErOaLkKPUi');
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
          title: Text('Face Detection'),
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
                child: knownPerson
                    ? Lottie.asset('aseets/images/hello-boy.json', height: 250)
                    : Container(
                        child: Text(''),
                      ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: knownPerson
                                ? Color.fromARGB(255, 0, 71, 133)
                                : isNobody
                                    ? Colors.green
                                    : Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20,
                        ),
                        child: Text(
                          '$displayText is here',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        )),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          setActivity.set({'detected': 'Nobody'});
                          setState(() {
                            //  detected = false;
                            knownPerson = false;
                            isNobody = true;
                          });
                          print('added');
                        } catch (e) {
                          print('error $e');
                        }
                      },
                      child: Text('OKAY'),
                    ),
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
