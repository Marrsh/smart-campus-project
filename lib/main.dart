import 'package:flutter/material.dart';
import 'constants.dart';
import 'bottomNavBar.dart';

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
          appBar: AppBar(title: Center(child: Text('University Name')), backgroundColor: yellow,foregroundColor: Colors.black,),
          body: Container(
            color: Colors.grey[100],
          ),
          bottomNavigationBar: NavBar(),
        )
    );
  }
}
