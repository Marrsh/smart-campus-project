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

          bottomNavigationBar: _NavBar(),
        )
    );
  }
}

class _NavBar extends StatelessWidget {
  @override
  List<NavButtonProperties> navButtons = [
    NavButtonProperties(icon: Icons.today_outlined, colour: Colors.grey[300], label: 'Timetable'),
    NavButtonProperties(icon: Icons.badge_outlined, colour: Colors.grey[300], label: 'ID'),
    NavButtonProperties(icon: Icons.calendar_today, colour: Colors.grey[300], label: 'nfc', isCentral: true),
    NavButtonProperties(icon: Icons.door_front_door_outlined, colour: Colors.grey[300], label: 'Rooms'),
    NavButtonProperties(icon: Icons.local_library_outlined, colour: Colors.grey[300], label: 'Library'
    ),
  ];

  Widget build(BuildContext context) {
    return Container(
      width: logicalScreenSize.width,
      height: height10,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var i = 0; i < navButtons.length; i++)
              if (navButtons[i].isCentral)
                _CentralNavButton()
              else
                _NavButton(navButtonProperties: navButtons[i]),
          ]
      )
    );
  }
}

class _NavButton extends StatelessWidget {
  _NavButton({required this.navButtonProperties});
  final navButtonProperties;
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(
          navButtonProperties.icon,
          color: navButtonProperties.colour,
          size: 35,
          semanticLabel: navButtonProperties.label,
        ),
        Text(
            navButtonProperties.label,
            style: TextStyle(
                color: navButtonProperties.colour,
                fontFamily: 'Roboto',
                fontSize: 10
            )
        )
      ],
    );
  }
}

class _CentralNavButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return
      Container(
        width: width25,
        child: OverflowBox(
          maxHeight: height50,
          child: SizedBox(
              child: Container(
                  decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                  ),
                  padding: EdgeInsets.all(mdPadding),
                  margin:EdgeInsets.only(bottom: height10),
                  child: Icon(
                    Icons.contactless_outlined,
                    size: 55,
                  )
              )
          ),
        ),
      );
  }
}
