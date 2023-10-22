import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(title: Text('settings')),
      body: Center(
          child: Text(
        'Settings Page',
        style: TextStyle(fontSize: 34),
      )),
    );
  }
}
