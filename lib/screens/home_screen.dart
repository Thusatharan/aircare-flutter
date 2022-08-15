import 'package:aircare/screens/elders-care.dart';
import 'package:aircare/screens/guardians_activity_detection.dart';
import 'package:aircare/screens/relative_recognition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(image: AssetImage('aseets/images/aircare_logo.jpeg')),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 200,
                        padding: EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width / 2,
                        child: InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoUpload())),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 3, 108, 168)
                                        .withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                color: Color.fromARGB(255, 4, 132, 206),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Icon(
                                      Icons.accessibility,
                                      size: 70,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                  Text(
                                    'Elders Care',
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                ],
                              )),
                        ),
                      ),
                      Container(
                        height: 200,
                        padding: EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width / 2,
                        child: InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GurdiansActivity())),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 4, 132, 206)
                                        .withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                color: Color.fromARGB(255, 4, 132, 206),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Icon(
                                      Icons.camera_outdoor_rounded,
                                      size: 70,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                  Text(
                                    'Guardians Activity Detection',
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        padding: EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width / 2,
                        child: InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RelativesRecognition())),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 3, 108, 168)
                                        .withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                color: Color.fromARGB(255, 4, 132, 206),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Icon(
                                      Icons.handshake_rounded,
                                      size: 70,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                  Text(
                                    'Relative Recognition',
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    ));
  }
}
