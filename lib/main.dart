import 'package:flutter/material.dart';
import 'constants.dart';
import 'bottomNavBar.dart';
import 'timetablePage.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.amber), // declare theme data for this widget?
        home: Scaffold(
          //Like stacks in swift, takes in the elements of the widget (body, appbar etc..)
          appBar: AppBar(title: Center(child: Text('University Name')), backgroundColor: yellow,foregroundColor: Colors.black),
            body:
            Stack(
                children: [
                  FirstRoute(),
                  Positioned(
                      bottom: 0,
                      child: NavBar()
                  )
                ]
            )
          //cannot be bottom navigation bar as it does not work on ios
          // bottomNavigationBar: NavBar(),
        )
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => timetablePage(),
                transitionDuration: Duration.zero,
              ),
            );

            // Navigate to second route when tapped.
          },
        )
    );
  }
}