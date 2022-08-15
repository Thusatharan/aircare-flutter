import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

import 'details_screen.dart';

class RelativesRecognition extends StatefulWidget {
  const RelativesRecognition({Key? key}) : super(key: key);

  @override
  State<RelativesRecognition> createState() => _RelativesRecognitionState();
}

class _RelativesRecognitionState extends State<RelativesRecognition> {
  File? selectedVideo;
  bool? isImageUploaded = false;

  Future pickImage(ImageSource source) async {
    try {
      print('hello');
      final selectedVideo = await ImagePicker().pickVideo(source: source);
      if (selectedVideo == null) return;

      final imageTemporary = File(selectedVideo.path);
      setState(() {
        this.selectedVideo = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Relative Recognition',
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () => pickImage(ImageSource.camera),
                      icon: Icon(Icons.video_call_outlined),
                      color: Color.fromARGB(255, 3, 108, 168),
                      iconSize: 100,
                    ),
                    selectedVideo != null
                        ? Text(
                            'Video Catured',
                            style: TextStyle(color: Colors.green, fontSize: 22),
                          )
                        : Text(
                            'Click the icon to capture a video',
                            style: TextStyle(
                                color: Color.fromARGB(255, 3, 108, 168),
                                fontSize: 15),
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        selectedVideo != null
                            ? ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailsScreen()),
                                  );
                                },
                                child: Text('Analyze Video'),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 3, 108, 168)),
                                    textStyle: MaterialStateProperty.all(
                                        TextStyle(fontSize: 14))),
                              )
                            : ElevatedButton(
                                onPressed: null,
                                child: Text('Analyze Video'),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.grey),
                                    textStyle: MaterialStateProperty.all(
                                        TextStyle(fontSize: 14))),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
