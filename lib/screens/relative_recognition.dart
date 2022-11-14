import 'dart:io';

import 'package:aircare/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';

class RelativeRecognision extends StatefulWidget {
  const RelativeRecognision({Key? key}) : super(key: key);

  @override
  State<RelativeRecognision> createState() => _RelativeRecognisionState();
}

class _RelativeRecognisionState extends State<RelativeRecognision> {
  // FirebaseDatabase database = FirebaseDatabase.instance;
  // DatabaseReference ref =
  //     FirebaseDatabase.instance.ref("activity");
  String displayText = 'Detecting...';
  final _database = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    activateListeners();
  }

  void activateListeners() {
    print('hiii');
    _database.child('activity').onValue.listen((event) {
      final activity = event.snapshot.value;
      setState(() {
        if (activity != null) {
          displayText = activity.toString();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final activity = _database.child('/activity');
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

        body: SafeArea(
            child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  try {
                    activity.set({'detected': 'Walking'});
                    print('added');
                  } catch (e) {
                    print('error $e');
                  }
                },
                child: Text('Test'),
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  child: Text(
                    displayText,
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  )),
            ],
          ),
        )),
      ),
    );
  }
}
