import 'package:flutter/material.dart';
import '../bottom-nav-bar.dart';
import '../constants.dart';
import '../main.dart';

class IdPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(child: Text('University Name')),
            backgroundColor: yellow,
            foregroundColor: Colors.black),
        body: Column(children: [
          Expanded(child: IdCard()),
          Positioned(bottom: 0, child: NavBar())
        ]));
  }
}

class IdCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Column(children: [
      Padding(
          padding: EdgeInsets.all(mdPadding),
          child: Column(
            children: [
              Text("Student ID",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 22, color: Colors.black)),
              Divider(
                thickness: 2,
                color: Colors.amber,
              ),
            ],
          )),
      Padding(
          padding: EdgeInsets.all(mdPadding),
          child:
              // height: 100,
              Container(
                  // color: Colors.white,
                  height: height40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.amber
                          // color: Colors.red[500],
                          ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  // width: logicalScreenSize.width,

                  child: Column(children: [
                    Row(children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          border: Border.all(color: Colors.amber
                              // color: Colors.red[500],
                              ),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20)),
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(mdPadding),
                            child: Text("university name/logo ")),
                      ))
                    ]),
                    Row(
                        // mainAxisAlignment: MainAxisAlignment.space,
                        children: [
                          Padding(
                              padding: EdgeInsets.all(lgPadding),
                              child: Container(
                                  color: Colors.black26,
                                  child: Icon(
                                    Icons.person,
                                    size: height15,
                                    color: Colors.white,
                                  ))),
                          Column(children: [
                            Text(
                              "Student Name",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "Student ID",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 16),
                            ),
                          ])
                        ]),
                    Text(
                      "Expiry Date: DD/MM/YYYY",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 16),
                    )
                  ])))
    ]));
  }
}
