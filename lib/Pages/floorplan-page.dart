import 'package:flutter/material.dart';
import '../bottom-nav-bar.dart';
import '../constants.dart';
import '../main.dart';

class FloorplanPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(child: Text('University Name')),
            backgroundColor: yellow,
            foregroundColor: Colors.black),
        body: Stack(children: [
          Center(
            child: Text("Floor Plan page"),
          ),
          Positioned(bottom: 0, child: NavBar())
        ]));
  }
}
