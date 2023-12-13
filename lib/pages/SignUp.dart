// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  User? user;

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              title: Text(
            'Sign Up',
            style: TextStyle(letterSpacing: 1.0),
          )),
          body: Center(
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width / 2.2)),
                // Text("Login"),
                // *TODO Insert a signUP Photo here
                Padding(
                  padding:
                      EdgeInsets.only(left: 50, right: 50, bottom: 20, top: 10),
                  child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Email Id',
                        border: OutlineInputBorder(),
                      )),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 50, right: 50, bottom: 20, top: 10),
                  child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'New Password',
                        border: OutlineInputBorder(),
                      )),
                ),
                ElevatedButton(
                    onPressed: () async {
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: nameController.text,
                                password: passwordController.text);
                        user = newUser.user;
                        await user!
                            .updateProfile(displayName: nameController.text);
                        await user?.reload();
                        user = _auth.currentUser;
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 10,
                        minimumSize: Size(90, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: Text("Register!")),
                SizedBox(
                  height: 200,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text("Existing User? Sign in")),
              ],
            ),
          )),
    );
  }
}
