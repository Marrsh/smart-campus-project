
import 'package:flutter/material.dart';
import '../bottomNavBar.dart';
import '../constants.dart';
import '../main.dart';

class LibraryFloorPlanPage extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text('University Name')), backgroundColor: yellow,foregroundColor: Colors.black),
        body:
        Stack(
            children: [
              Center(
                child: Text("Library Floor plan"),
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
