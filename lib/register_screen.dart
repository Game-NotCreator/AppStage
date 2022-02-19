// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gamenotcreator_evolution/authservice.dart';
import 'package:gamenotcreator_evolution/profile_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gamenotcreator_evolution/login_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<RegisterPage> {
  bool fnErr = false;
  bool emailErr = false;
  bool passErr = false;
  String fullnameRequired = '';
  String emailRequired = "";
  String passwordRequired = '';
  late String email;
  late String password;
  late String fullname;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    setState(() {
      fullnameRequired = "";
      emailRequired = "";
      passwordRequired = "";
      fnErr = false;
      emailErr = false;
      passErr = false;
    });
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (emailErr) {
      setState(() {
        emailRequired = "Email Required";
      });
    } else {
      setState(() {
        emailRequired = "";
      });
    }

    if (fnErr) {
      setState(() {
        fullnameRequired = "Full Name Required";
      });
    } else {
      setState(() {
        fullnameRequired = "";
      });
    }

    if (passErr) {
      setState(() {
        passwordRequired = "Password Required";
      });
    } else {
      setState(() {
        passwordRequired = "";
      });
    }

    Future<void> register() async {
      try {
        await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Registered'),
          duration: Duration(milliseconds: 1000),
        ));
        AuthService()
            .signInUsingEmailPassword(
                email: email, password: password, context: context)
            .then((value) => {
                  if (value is User)
                    {
                      value.updateDisplayName(fullname),
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const ProfilePage()))
                    }
                });
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed with : ${e.code}'),
          duration: const Duration(milliseconds: 1000),
        ));
      }
    }

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
                              margin: const EdgeInsets.only(right: 40),
                              // ignore: prefer_const_constructors
                              child: Text('Create New Account',
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
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                  labelText: 'Full name',
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 180),
                              child: fnErr == false
                                  ? Container()
                                  : Text(
                                      fullname == "" ? fullnameRequired : "",
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 210),
                              child: emailErr == false
                                  ? Container()
                                  : Text(
                                      email == "" ? emailRequired : "",
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: TextField(
                                obscureText: true,
                                controller: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: const InputDecoration(
                                  //  color: Color.fromRGBO(35, 66, 121, 100),
                                  labelText: 'Password',
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(right: 180, top: 10),
                              child: passErr == false
                                  ? Container()
                                  : Text(
                                      passwordRequired,
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                            FlatButton(
                              onPressed: () {
                                email = emailController.text;
                                password = passwordController.text;
                                fullname = nameController.text;
                                if (fullname == "") {
                                  setState(() {
                                    fnErr = true;
                                  });
                                } else if (email == "") {
                                  setState(() {
                                    fnErr = false;
                                    emailErr = true;
                                  });
                                } else if (password == "") {
                                  setState(() {
                                    emailErr = false;
                                    passErr = true;
                                  });
                                } else {
                                  setState(() {
                                    passErr = false;
                                  });
                                  register();
                                  // Navigator.push(
                                  //     context,
                                  //     PageTransition(
                                  //         type: PageTransitionType.fade,
                                  //         child: const LoginPage()));
                                }
                              },
                              child: Container(
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
                                    "Registration",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
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
                                          color:
                                              Color.fromRGBO(19, 52, 109, 100),
                                        )),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child:
                                                const LoginPage())); //login screen
                                  },
                                )
                              ],
                            ),
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
