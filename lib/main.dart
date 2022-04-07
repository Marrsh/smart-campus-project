import 'package:page_transition/page_transition.dart';
import 'package:student_companion_java/Pages/floorplan-page.dart';
import 'package:student_companion_java/Pages/id-page.dart';
import 'package:student_companion_java/Pages/library-floor-plan-page.dart';
import 'package:student_companion_java/nfc-pop-up.dart';
import 'constants.dart';
import 'bottom-nav-bar.dart';
import 'Pages/timetable-page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //initialise firebase
  await Firebase.initializeApp();
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimetablePage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/timetable':
            return PageTransition(
                child: TimetablePage(),
                type: PageTransitionType.fade,
                duration: const Duration(seconds: 0));
            break;
          case '/id':
            return PageTransition(
                child: IdPage(),
                type: PageTransitionType.fade,
                duration: const Duration(seconds: 0));
            break;
          case '/floorplan':
            return PageTransition(
                child: FloorplanPage(),
                type: PageTransitionType.fade,
                duration: const Duration(seconds: 0));
            break;
          case '/library':
            return PageTransition(
                child: LibraryFloorPlanPage(),
                type: PageTransitionType.fade,
                duration: const Duration(seconds: 0));
            break;
          // case '/nfcTest':

          //   // NFCReader();
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
      // initialRoute: '/timetable'
    );
  }
}

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Center(child: Text('University Name')),
            backgroundColor: yellow,
            foregroundColor: Colors.black),
        body: Stack(children: [Positioned(bottom: 0, child: NavBar())]));
  }
}
