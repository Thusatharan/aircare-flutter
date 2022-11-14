import 'package:aircare/screens/components/fall_screen.dart';
import 'package:aircare/screens/components/mask_screen.dart';
import 'package:aircare/screens/components/relatives_screen.dart';
import 'package:aircare/screens/components/sleep_screen.dart';
import 'package:aircare/screens/components/weapon_screen.dart';
import 'package:aircare/screens/elders-care.dart';
import 'package:aircare/screens/guardians_activity_detection.dart';
import 'package:aircare/screens/relative_recognition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 165, 155, 219),
            Color.fromARGB(255, 181, 228, 196),
          ],
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    Lottie.asset('aseets/images/cctv.json'),
                    Column(
                      children: [
                        Expanded(flex: 1, child: Container()),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EldersCare()));
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromARGB(
                                                    255, 0, 71, 133)),
                                        padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(vertical: 5),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            ("aseets/images/elder.png"),
                                            height: 60,
                                            // AssetImage),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Activity',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SleepDetection()));
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromARGB(
                                                    255, 0, 71, 133)),
                                        padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(vertical: 5),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            ("aseets/images/sleep.png"),
                                            height: 60,
                                            // AssetImage),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Sleep',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    // height: 100,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FallScreen()));
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromARGB(
                                                    255, 0, 71, 133)),
                                        padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(vertical: 5),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            ("aseets/images/fall.png"),
                                            height: 60,
                                            // AssetImage),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Fall',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // height: 100,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MaskDetection()));
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromARGB(
                                                    255, 0, 71, 133)),
                                        padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(vertical: 5),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            ("aseets/images/mask.png"),
                                            height: 60,
                                            // AssetImage),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Mask',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    // height: 100,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    WeaponsScreen()));
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromARGB(
                                                    255, 0, 71, 133)),
                                        padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(vertical: 5),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            ("aseets/images/knife.png"),
                                            height: 60,
                                            // AssetImage),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Weapon',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // height: 100,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RelativesDetection()));
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromARGB(
                                                    255, 0, 71, 133)),
                                        padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(vertical: 5),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            ("aseets/images/care.png"),
                                            height: 60,
                                            // AssetImage),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Relatives',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          )),
    );
  }
}
