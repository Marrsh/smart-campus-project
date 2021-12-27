import 'package:page_transition/page_transition.dart';
import 'package:student_companion_java/Pages/floorplanPage.dart';
import 'package:student_companion_java/Pages/idPage.dart';
import 'package:student_companion_java/Pages/libraryFloorPlanPage.dart';
import 'package:student_companion_java/nfcTest.dart';
import 'constants.dart';
import 'bottomNavBar.dart';
import 'Pages/timetablePage.dart';
import 'package:flutter/material.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
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
          case '/nfcTest':
            return PageTransition(child: MyNFCApp(), type: PageTransitionType.scale,duration: Duration(seconds: 0));
            break;

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
      initialRoute: '/timetable'
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




