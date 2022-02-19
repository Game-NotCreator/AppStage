// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:firebase_core/firebase_core.dart';
import 'package:gamenotcreator_evolution/profile_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'splash_screen.dart';
import 'login_screen.dart';
import 'register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.indigo, scaffoldBackgroundColor: Colors.white),
      //home: const LoginPage(),\
      home: const SplashScreen(),
    );
    // return
  }
}
