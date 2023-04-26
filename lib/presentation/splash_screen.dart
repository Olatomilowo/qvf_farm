import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qvf_farm/presentation/sign_up_screen.dart';

import '../core/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        (() => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SignUpScreen()))));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor2,
      body: Center(child: Image.asset('images/SplashScreen.jpeg')),
    );
  }
}
