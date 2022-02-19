// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
              context,
              PageTransition(
                  type: PageTransitionType.fade, child: const LoginPage()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors, unused_element

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(bottom: 40),
          child: Image.asset(
            'assets/IMG/logo.png',
            width: 250,
            height: 150,
          ),
        ),
      ),
    );
  }
}
