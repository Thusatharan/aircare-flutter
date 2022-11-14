import 'dart:io';

import 'package:aircare/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';

class EldersCare extends StatefulWidget {
  const EldersCare({Key? key}) : super(key: key);

  @override
  State<EldersCare> createState() => _EldersCareState();
}

class _EldersCareState extends State<EldersCare> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref =
      FirebaseDatabase.instance.ref("activity/-NGnxHgVDX_kHX2qQcKB");

  @override
  void initState() {
    print(ref.child('detectedActivity'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,

      body: SafeArea(
          child: Container(
        child: Text('hii'),
      )),
    );
  }
}
