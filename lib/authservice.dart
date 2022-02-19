import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthService {
  late String error = "";
  Future<dynamic> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        error = "User Not Found";
      } else if (e.code == 'wrong-password') {
        error = "Wrong Password";
      } else {
        error = e.code;
      }
      return error;
    }
  }
}
