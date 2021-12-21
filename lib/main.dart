import 'dart:ffi';

import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class NavButtonProperties {
  const NavButtonProperties(
      {required this.icon, required this.colour, required this.label, this.isCentral = false});
  final IconData icon;
  final Color? colour;
  final String label;
  final bool isCentral;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.amber), // declare theme data for this widget?
        home: Scaffold(
          //Like stacks in swift, takes in the elements of the widget (body, appbar etc..)
          appBar: AppBar(title: Center(child: Text('University Name'))),
          body: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  child: _NavBar()
              )
            ],
          )
        )
    );
  }
}

class _NavBar extends StatelessWidget {
  @override
  List<NavButtonProperties> navButtons = [
    NavButtonProperties(icon: Icons.calendar_today, colour: Colors.grey[300], label: 'test'),
    NavButtonProperties(icon: Icons.calendar_today, colour: Colors.grey[300], label: 'test'),
    NavButtonProperties(icon: Icons.calendar_today, colour: Colors.grey[300], label: 'nfc', isCentral: true),
    NavButtonProperties(icon: Icons.calendar_today, colour: Colors.grey[300], label: 'test'),
    NavButtonProperties(icon: Icons.calendar_today, colour: Colors.grey[300], label: 'test'
    ),
  ];

  Widget build(BuildContext context) {
    return Container(
      width: logicalScreenSize.width,
      height: height10,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (var i = 0; i < navButtons.length; i++)
      if (navButtons[i].isCentral)
        _CentralNavButton()
      else
        _NavButton(
            navButtonProperties: navButtons[i],
            isMarginLeft: (i <= 2) ? true : false
        )
          ]
      )
    );
  }
}

class _NavButton extends StatelessWidget {
  _NavButton({required this.navButtonProperties, required this.isMarginLeft});
  final isMarginLeft;
  final navButtonProperties;
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child:
        Icon(
          navButtonProperties.icon,
          color: navButtonProperties.colour,
          size: 50,
          semanticLabel: navButtonProperties.label,
        )
    );
  }
}

class _CentralNavButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return Expanded(
        flex: 4,
        child:OverflowBox(
            maxHeight: 150,
            // margin: const EdgeInsets.only(bottom: 150),
            child:Container(
              margin: const EdgeInsets.only(bottom: 150),
              child: Icon(
                Icons.ac_unit,
                color: Colors.yellow,
                size: 80,
              )
            )
        )
    );
  }
}
