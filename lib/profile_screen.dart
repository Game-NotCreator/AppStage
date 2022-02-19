import 'package:gamenotcreator_evolution/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:avatars/avatars.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  SizedBox(
                    height: 150,
                    child: AppBar(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(30),
                        ),
                      ),
                      backgroundColor: Colors.indigo,
                      centerTitle: true,
                      elevation: 0.0,
                      title: const Text(
                        "My profile",
                      ),
                      leading: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: const LoginPage()));
                        },
                        child: const Icon(Icons.arrow_back_rounded),
                      ),
                      actions: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: GestureDetector(
                                onTap: () {},
                                child: const Icon(Icons.info_outlined))),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 100, left: 25),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          width: 365,
                          height: 95,
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(left: 50),
                                  child: Avatar(
                                    shape: AvatarShape.rectangle(
                                        80,
                                        80,
                                        const BorderRadius.all(
                                            Radius.circular(360.0))),
                                    sources: [
                                      InstagramSource(
                                          'game_notcreator'), // Fallback if GitHubSource is not available
                                    ],
                                    name:
                                        'Hedi Fourati', // Fallback if no image source is available
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(left: 20),
                                    child: const Text('Hedi Fourati',
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(
                                            color: Color.fromRGBO(0, 0, 0, 100),
                                            fontSize: 20)))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  // ignore: prefer_const_constructors
                  SizedBox(
                    width: 365,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 0),
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 365,
                    child: Card(
                      color: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: RoundedExpansionTile(
                        leading:
                            const Icon(Icons.settings, color: Colors.white),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        title: Container(
                          padding: const EdgeInsets.only(top: 15),
                          height: 60,
                          child: const Text(
                            'General Informations',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        trailing: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                        rotateTrailing: true,
                        children: [
                          Card(
                            margin: const EdgeInsets.only(top: 10),
                            //color: const Color.fromRGBO(226, 237, 255, 100),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: RoundedExpansionTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              title: Container(
                                padding: const EdgeInsets.only(top: 15),
                                height: 60,
                                child: const Text(
                                  'Full name',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              trailing: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                              ),
                              rotateTrailing: true,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 16),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'FullName',
                                    ),
                                  ),
                                ), //Here the container for Fullname

                                Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: const Text("Description")),
                                const Divider(
                                  height: 30,
                                  thickness: 2,
                                  indent: 10,
                                  endIndent: 10,
                                  color: Colors.black,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: Text(
                                      'This is a personalized message',
                                      style:
                                          Theme.of(context).textTheme.caption,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 16),
                                  margin: const EdgeInsets.only(top: 10),
                                  child: const TextField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Description',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            margin: const EdgeInsets.only(top: 50),
                            //color: const Color.fromRGBO(226, 237, 255, 100),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: RoundedExpansionTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              title: Container(
                                padding: const EdgeInsets.only(top: 15),
                                height: 60,
                                child: const Text(
                                  'Share my informations',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              trailing: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                              ),
                              rotateTrailing: true,
                              children: [
                                const Divider(
                                  height: 30,
                                  thickness: 2,
                                  indent: 10,
                                  endIndent: 10,
                                  color: Colors.black,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: const Text('Share my name'),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 160),
                                      child: Switch(
                                        activeColor: Colors.green,
                                        value: isSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            isSwitched = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  height: 30,
                                  thickness: 1,
                                  indent: 10,
                                  endIndent: 10,
                                  color: Colors.black,
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 5, bottom: 30),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child:
                                            const Text('Share my description'),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(left: 123),
                                        child: Switch(
                                          activeColor: Colors.green,
                                          value: isSwitched,
                                          onChanged: (value) {
                                            setState(() {
                                              isSwitched = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ), //Here the container for Share my informations
                                )
                              ],
                            ),
                          ),
                          Card(
                            margin: const EdgeInsets.only(top: 50),
                            // color: const Color.fromRGBO(226, 237, 255, 100),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: RoundedExpansionTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              title: Container(
                                padding: const EdgeInsets.only(top: 15),
                                height: 60,
                                child: const Text(
                                  'Other informations',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              trailing: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                              ),
                              rotateTrailing: true,
                              children: [
                                const Divider(
                                  height: 30,
                                  thickness: 2,
                                  indent: 10,
                                  endIndent: 10,
                                  color: Colors.black,
                                ),
                                Container(), //Here the container for Other informations
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 50,
                width: 365,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // ignore: prefer_const_literals_to_create_immutables
                    gradient: const LinearGradient(colors: [
                      Colors.indigo,
                      Colors.indigo,
                    ])),
                child: const Center(
                  child: Text(
                    "SAVE",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
