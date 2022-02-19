// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:gamenotcreator_evolution/register_screen.dart';
import 'package:gamenotcreator_evolution/login_screen.dart';

class FPPage extends StatefulWidget {
  const FPPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<FPPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 0),
            height: 900,
            decoration: const BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    image: AssetImage('assets/IMG/background.png'),
                    opacity: 0.2,
                    fit: BoxFit.fill)),
            child: Stack(
              children: <Widget>[
                Positioned(
                    child: Container(
                  margin: const EdgeInsets.only(bottom: 570),
                  child: Center(
                    child: Image.asset(
                      'assets/IMG/logo.png',
                      width: 250,
                      height: 150,
                    ),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 270),
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: <Widget>[
                            // ignore: avoid_unnecessary_containers
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              // ignore: prefer_const_constructors
                              child: Text('Forgot your password ?',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromRGBO(
                                          19, 52, 109, 100),
                                      fontSize: 30)),
                              //style:TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  gradient: const LinearGradient(colors: [
                                    Color.fromRGBO(19, 52, 109, 100),
                                    Color.fromRGBO(19, 52, 109, 100),
                                  ])),
                              child: const Center(
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Column(children: <Widget>[
                              Row(
                                children: <Widget>[
                                  const Text('Does not have account?'),
                                  FlatButton(
                                    textColor: Colors.blue,
                                    // ignore: prefer_const_constructors
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 30),
                                      child: const Text("Sign in",
                                          // ignore: prefer_const_constructors
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromRGBO(
                                                19, 52, 109, 100),
                                          )),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: const RegisterPage()));
                                    },
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  const Text('Have an account?'),
                                  FlatButton(
                                    textColor: Colors.blue,
                                    // ignore: prefer_const_constructors
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 30),
                                      child: const Text("Login",
                                          // ignore: prefer_const_constructors
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromRGBO(
                                                19, 52, 109, 100),
                                          )),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: const LoginPage()));
                                    },
                                  )
                                ],
                              ),
                            ]),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ])));
  }
}
