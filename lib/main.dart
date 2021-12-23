import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:student_companion/Pages/floorplanPage.dart';
import 'package:student_companion/Pages/idPage.dart';
import 'package:student_companion/Pages/libraryFloorPlanPage.dart';
import 'constants.dart';
import 'bottomNavBar.dart';
import 'Pages/timetablePage.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/timetable':
            return PageTransition(child: TimetablePage(), type: PageTransitionType.scale, duration: Duration(seconds: 0));
            break;
          case '/id':
            return PageTransition(child: IdPage(), type: PageTransitionType.scale, duration: Duration(seconds: 0));
            break;
          case '/floorplan':
            return PageTransition(child: FloorplanPage(), type: PageTransitionType.scale, duration: Duration(seconds: 0));
            break;
          case '/library':
            return PageTransition(child: LibraryFloorPlanPage(), type: PageTransitionType.scale, duration: Duration(seconds: 0));
            break;
          // case '/timetable':
          //   return PageTransition(child: TimetablePage(), type: PageTransitionType.scale);
          //   break;

          default:
            return null;
        }
      },


      // routes: {
      //   '/timetable': (context) => TimetablePage(),
      //   '/id': (context) => IdPage(),
      //   '/floorplan': (context) => FloorplanPage(),
      //   '/library': (context) => LibraryFloorPlanPage(),
      //   '/': (context) => HomePage(),
      // },
      initialRoute: '/timetable',
    );
  }
}


class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text('University Name')), backgroundColor: yellow,foregroundColor: Colors.black),
        body:
        Stack(
            children: [
              Positioned(
                  bottom: 0,
                  child: NavBar()
              )
            ]
        )
    );
  }
}
