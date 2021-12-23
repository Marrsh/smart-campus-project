// import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:student_companion/Pages/floorplanPage.dart';
import 'package:student_companion/Pages/idPage.dart';
import 'package:student_companion/Pages/libraryFloorPlanPage.dart';
import 'constants.dart';
import 'bottomNavBar.dart';
import 'Pages/timetablePage.dart';


import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => App();
}

class App extends State<MyApp> {
   ValueNotifier<dynamic> result = ValueNotifier(null);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('NfcManager Plugin Example')),
        body: SafeArea(
          child: FutureBuilder<bool>(
            future: NfcManager.instance.isAvailable(),
            builder: (context, ss) => ss.data != true
                ? Center(child: Text('NfcManager.isAvailable(): ${ss.data}'))
                : Flex(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    direction: Axis.vertical,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.all(4),
                          constraints: BoxConstraints.expand(),
                          decoration: BoxDecoration(border: Border.all()),
                          child: SingleChildScrollView(
                            child: ValueListenableBuilder<dynamic>(
                              valueListenable: result,
                              builder: (context, value, _) =>
                                  Text('${value ?? ''}'),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: GridView.count(
                          padding: EdgeInsets.all(4),
                          crossAxisCount: 2,
                          childAspectRatio: 4,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                          children: [
                            ElevatedButton(
                                child: Text('Tag Read'), onPressed: _tagRead),
                            ElevatedButton(
                                child: Text('Ndef Write'),
                                onPressed: _ndefWrite),
                            ElevatedButton(
                                child: Text('Ndef Write Lock'),
                                onPressed: _ndefWriteLock),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      )









      // onGenerateRoute: (settings) {
      //   switch (settings.name) {
      //     case '/timetable':
      //       return PageTransition(child: TimetablePage(), type: PageTransitionType.scale, duration: Duration(seconds: 0));
      //       break;
      //     case '/id':
      //       return PageTransition(child: IdPage(), type: PageTransitionType.scale, duration: Duration(seconds: 0));
      //       break;
      //     case '/floorplan':
      //       return PageTransition(child: FloorplanPage(), type: PageTransitionType.scale, duration: Duration(seconds: 0));
      //       break;
      //     case '/library':
      //       return PageTransition(child: LibraryFloorPlanPage(), type: PageTransitionType.scale, duration: Duration(seconds: 0));
      //       break;
      //     // case '/timetable':
      //     //   return PageTransition(child: TimetablePage(), type: PageTransitionType.scale);
      //     //   break;

      //     default:
      //       return null;
      //   }
      // },


      // routes: {
      //   '/timetable': (context) => TimetablePage(),
      //   '/id': (context) => IdPage(),
      //   '/floorplan': (context) => FloorplanPage(),
      //   '/library': (context) => LibraryFloorPlanPage(),
      //   '/': (context) => HomePage(),
      // },
      // initialRoute: '/timetable',
    );

}
    //nfc
  void _tagRead() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      result.value = tag.data;
      NfcManager.instance.stopSession();
    });
  }

  void _ndefWrite() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null || !ndef.isWritable) {
        result.value = 'Tag is not ndef writable';
        NfcManager.instance.stopSession(errorMessage: result.value);
        return;
      }

      NdefMessage message = NdefMessage([
        NdefRecord.createText('Hello World!'),
        NdefRecord.createUri(Uri.parse('https://flutter.dev')),
        NdefRecord.createMime(
            'text/plain', Uint8List.fromList('Hello'.codeUnits)),
        NdefRecord.createExternal(
            'com.example', 'mytype', Uint8List.fromList('mydata'.codeUnits)),
      ]);

      try {
        await ndef.write(message);
        result.value = 'Success to "Ndef Write"';
        NfcManager.instance.stopSession();
      } catch (e) {
        result.value = e;
        NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }
    });
  }

  void _ndefWriteLock() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null) {
        result.value = 'Tag is not ndef';
        NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }

      try {
        await ndef.writeLock();
        result.value = 'Success to "Ndef Write Lock"';
        NfcManager.instance.stopSession();
      } catch (e) {
        result.value = e;
        NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }
    });
  }
  }
// }


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




