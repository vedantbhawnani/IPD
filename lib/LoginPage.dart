// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              title: Text(
            'Login Page',
            style: TextStyle(letterSpacing: 1.0),
          )),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width / 2)),
                  // Text("Login"),
                  // *TODO Insert a Login Photo here
                  Padding(
                    padding: EdgeInsets.only(
                        left: 50, right: 50, bottom: 20, top: 10),
                    child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Email Id',
                          border: OutlineInputBorder(),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 50, right: 50, bottom: 20, top: 10),
                    child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        )),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        // Navigator.pushNamed(context, '/home');
                        try {
                          User? user;
                          UserCredential userCredential =
                              await _auth.signInWithEmailAndPassword(
                            email: nameController.text,
                            password: passwordController.text,
                          );
                          user = userCredential.user;
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided.');
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 10,
                          minimumSize: Size(90, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      child: Text("Login!")),
                  SizedBox(
                    height: 200,
                  ),
                  TextButton(
                      onPressed: () async {}, child: Text("New User? Sign up")),
                ],
              ),
            ),
          )),
    );
  }
}
