
import 'package:flutter/material.dart';
import '../bottomNavBar.dart';
import '../constants.dart';
import '../main.dart';

class TimetablePage extends StatelessWidget {
  const TimetablePage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text('University Name')), backgroundColor: yellow,foregroundColor: Colors.black),
        body:
        Stack(
            children: [
        Center(
        child: Text("Timetable page"),
    ),
              Positioned(
                  bottom: 0,
                  child: NavBar()
              )
            ]
        )
    );
  }
}



