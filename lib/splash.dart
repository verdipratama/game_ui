import 'dart:async';

import 'package:flutter/material.dart';
import 'package:game_ui/constants.dart';
import 'package:game_ui/login.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;

    _startSplashScreen() async {
      var duration = const Duration(seconds: 2);
      return Timer(duration, () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
        );
      });
    }

    _startSplashScreen();

    return Scaffold(
      body: Container(
        height: screenH,
        width: screenW,
        color: kOrange,
        child: Stack(
          alignment: Alignment.center,
          children: const [
            Text(
              'TOPAPP',
              style: TextStyle(
                fontFamily: 'Righteous',
                fontSize: 45.0,
                color: kWhite,
              ),
            ),
            Positioned(
              bottom: 20.0,
              child: Text(
                '1.3.3.7',
                style: TextStyle(color: kWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
