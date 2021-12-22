import 'package:flutter/material.dart';
import 'constants.dart';

class NavButtonProperties {
  const NavButtonProperties(
      {required this.icon, required this.colour, required this.label, this.isCentral = false});
  final IconData icon;
  final Color? colour;
  final String label;
  final bool isCentral;
}

class NavBar extends StatelessWidget {
  @override

  // NavButton({required this.activePage});
  List<NavButtonProperties> navButtons = [
    NavButtonProperties(icon: Icons.today_outlined, colour: Colors.grey, label: 'Timetable'),
    NavButtonProperties(icon: Icons.badge_outlined, colour: Colors.grey, label: 'ID'),
    NavButtonProperties(icon: Icons.calendar_today, colour: blue, label: 'nfc', isCentral: true),
    NavButtonProperties(icon: Icons.door_front_door_outlined, colour: Colors.grey, label: 'Rooms'),
    NavButtonProperties(icon: Icons.local_library_outlined, colour: Colors.grey, label: 'Library'
    ),
  ];

  Widget build(BuildContext context) {

    return Container(
        width: logicalScreenSize.width,
        height: height10,
        decoration: BoxDecoration(
          boxShadow:[
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
            )
          ],
          color: Colors.grey[200],
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
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
          size: width9,
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
        width: width20,
        child: OverflowBox(
          maxHeight: height50,
          child: SizedBox(
              child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: blue,
                    boxShadow:[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                      )
                    ],
                  ),
                  padding: EdgeInsets.all(mdPadding),
                  margin:EdgeInsets.only(bottom: height10),
                  child: Icon(
                    Icons.contactless_outlined,
                    color: Colors.white,
                    size: width10,
                  )
              )
          ),
        ),
      );
  }
}
