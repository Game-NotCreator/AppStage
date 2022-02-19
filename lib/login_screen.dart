// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gamenotcreator_evolution/authservice.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gamenotcreator_evolution/register_screen.dart';
import 'package:gamenotcreator_evolution/forgotpassword_screen.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gamenotcreator_evolution/profile_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<LoginPage> {
  bool emailErr = false;
  bool passErr = false;
  String emailRequired = "";
  String passwordRequired = '';
  late String email;
  late String password;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;

  final emailValidator = MultiValidator([
    // RequiredValidator(errorText: 'password is required'),
  ]);

  @override
  void initState() {
    setState(() {
      emailRequired = "";
      passwordRequired = "";
      emailErr = false;
      passErr = false;
    });
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors

    if (emailErr) {
      setState(() {
        emailRequired = "Email Required";
      });
    } else {
      setState(() {
        emailRequired = "";
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
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            key: formKey,
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
                                  margin: const EdgeInsets.only(right: 240),
                                  // ignore: prefer_const_constructors
                                  child: Text('Login',
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
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    //validator: emailValidator,
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
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: TextField(
                                    obscureText: true,
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: passwordController,
                                    decoration: const InputDecoration(
                                      //  color: Color.fromRGBO(35, 66, 121, 100),
                                      labelText: 'Password',
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      right: 180, top: 10),
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
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: const FPPage()));
                                    //forgot password screen
                                  },
                                  textColor: Colors.blue,
                                  child: const Text('Forgot Password',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(19, 52, 109, 100),
                                      )),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    email = emailController.text;
                                    password = passwordController.text;
                                    if (email == "") {
                                      setState(() {
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
                                      AuthService()
                                          .signInUsingEmailPassword(
                                              email: email,
                                              password: password,
                                              context: context)
                                          .then((value) => {
                                                if (value is User)
                                                  {
                                                    Navigator.push(
                                                        context,
                                                        PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                const ProfilePage()))
                                                  }
                                                else if (value is String)
                                                  {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      backgroundColor:
                                                          Colors.red,
                                                      content: Text(value),
                                                      duration: const Duration(
                                                          milliseconds: 1000),
                                                    ))
                                                  }
                                              });
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
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),

                                Row(
                                  children: <Widget>[
                                    const Text('Does not have account?'),
                                    FlatButton(
                                      textColor: Colors.blue,
                                      // ignore: prefer_const_constructors
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 30),
                                        child: const Text("Register",
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
