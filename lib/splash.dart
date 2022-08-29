import 'dart:async';

import 'package:flutter/material.dart';
import 'package:game_ui/constants.dart';
import 'package:game_ui/login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
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

  @override
  void initState() {
    _startSplashScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;
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
