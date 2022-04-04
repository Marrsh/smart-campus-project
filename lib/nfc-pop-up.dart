import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';

class NFCReader extends StatefulWidget {
  @override
  _NFCReaderState createState() => _NFCReaderState();
}

class _NFCReaderState extends State {
  bool _supportsNFC = false;
  bool _reading = false;
  late StreamSubscription<NDEFMessage> _stream;

  @override
  void initState() {
    super.initState();
    // Check if the device supports NFC reading
    NFC.isNDEFSupported.then((bool isSupported) {
      setState(() {
        _supportsNFC = isSupported;
      });
    });
  }

  String id = 'test';

  @override
  Widget build(BuildContext context) {
    if (!_supportsNFC) {
      return RaisedButton(
        child: const Text("Your device does not support NFC"),
        onPressed: null,
      );
    }
    setState(() {
      _reading = true;
      // Start reading using NFC.readNDEF()
      _stream = NFC
          .readNDEF(
        once: true,
        throwOnUserCancel: false,
      )
          .listen((NDEFMessage message) {
        print(message.payload);
        // itemInfo = getMuseumItemData(message.data ?? 'co8821096');
        id = message.data!;
        // Navigator.pushNamed(context, '/item-view',
        //     arguments: ScreenArguments(id));
        // _stream.cancel();
        // setState(() {
        //   _reading = false;
        // });
      }, onError: (e) {
        // Check error handling guide below
      });
    });

    return SimpleDialog(
      title: Text('testing popup'),
      children: [Text("test")],
    );

    // Scaffold(
    //     backgroundColor: Colors.deepPurple,
    //     body: Column(
    //         // mainAxisAlignment: MainAxisAlignment.center,
    //         // crossAxisAlignment: CrossAxisAlignment.s,
    //         children: [
    //           Spacer(),
    //           IconButton(
    //             onPressed: () {
    //               if (_reading) {
    //                 _stream.cancel();
    //                 setState(() {
    //                   _reading = false;
    //                 });
    //                 Navigator.pushNamed(context, '/home');
    //               }
    //             },
    //             icon: Icon(
    //               Icons.cancel,
    //               color: Colors.white,
    //               // size: 76.0,
    //               semanticLabel: 'Text to announce in accessibility modes',
    //             ),
    //             iconSize: 76,
    //           ),
    //           Spacer(),
    //           Text(
    //             'Scanning for NFC tag',
    //             style: TextStyle(color: Colors.white, fontSize: 16),
    //           ),
    //           Spacer(),
    //           Spacer(),
    //         ])
    // );
  }
}
