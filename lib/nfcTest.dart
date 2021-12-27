import 'dart:convert';
import 'package:flutter/material.dart';
import 'bottomNavBar.dart';

import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:ndef/ndef.dart' as ndef;

class MyNFCApp extends StatelessWidget {
  // @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('NfcManager Plugin Example')),
        body:
        Stack(
          children: [
            Center(
                child:
                ElevatedButton(child: Text('Tag Read'), onPressed: _tagRead)),
            Positioned(bottom: 0, child: NavBar())
          ],
        )
    );
  }

  //nfc
  Future<void> _tagRead() async {
    //add in checks if the tag is not what we are looking for.
    var message;
    var availability = await FlutterNfcKit.nfcAvailability;
    if (availability != NFCAvailability.available) {
      print('tag not accesible');
      // oh-no
    }
    var tag = await FlutterNfcKit.poll(timeout: Duration(seconds: 10),
        iosMultipleTagMessage: "Multiple tags found!",
        iosAlertMessage: "Scan your tag");
    if (tag.ndefAvailable) {
      for (var record in await FlutterNfcKit.readNDEFRecords(cached: false)) {
        message = record;
        print(message.text);
      }
// Call finish() only once
      await FlutterNfcKit.finish();
// iOS only: show alert/error message on finish
      await FlutterNfcKit.finish(iosAlertMessage: "Success");
// or
      await FlutterNfcKit.finish(iosErrorMessage: "Failed");
    }
  }
}



