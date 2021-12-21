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
                // child: _CentralNavButton(),
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
    return
    Padding(padding: EdgeInsets.only(left: 15,bottom: 10, right: 15, top: 5),
    child:
        GestureDetector(
          onTap: () {
            print('test');
          },
          child:Column(
        children: [
          Expanded(
          flex: 2,
          child:
          Icon(
            navButtonProperties.icon,
            color: navButtonProperties.colour,
            size: 35,
            semanticLabel: navButtonProperties.label,
          )
      ),
          Text(navButtonProperties.label,style: TextStyle(
            color: navButtonProperties.colour,
            fontFamily: 'Roboto',
            fontSize: 10
          )
          )
        ],
      ),
        )
    );
  }
}

class _CentralNavButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child:OverflowBox(
            maxHeight: 150,
            child:
            Column(
              children: [
                Container(
                  color: Colors.red,
                  child: Icon(
                    Icons.contactless_outlined,
                    color: Colors.yellow,
                    size: 85,
                  )
                ),
                Container(
                  height: 150,
                )
              ],
            )
        )
    );
  }
}
