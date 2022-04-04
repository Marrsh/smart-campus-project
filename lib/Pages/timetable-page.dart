import 'package:flutter/material.dart';
import '../bottom-nav-bar.dart';
import '../constants.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TimetablePage extends StatelessWidget {
  // const TimetablePage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(child: Text('University Name')),
            backgroundColor: yellow,
            foregroundColor: Colors.black),
        body: Column(children: [
          Expanded(child: ItemsList()),
          Positioned(bottom: 0, child: NavBar())
        ]));
  }
}

DateDivider(String date) {
  // const DateDivider({required this.date});
  // final String date;

  // Widget build(BuildContext context) {
  return (Column(
    children: [
      Text(date,
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 22, color: Colors.black)),
      Divider(
        thickness: 2,
        color: Colors.amber,
      ),
    ],
  ));
}

class ItemsList extends StatelessWidget {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('Timetable').snapshots();
  Widget build(BuildContext context) {
    return (StreamBuilder(
        stream: users,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading...');
          }
          final data = snapshot.requireData;
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: data.size,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return (DateDivider("Today"));
                }

                return Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          border: Border.all(color: Colors.amber
                              // color: Colors.red[500],
                              ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      height: height15,
                      width: logicalScreenSize.width,
                      //   color: Colors.amber,
                      child: Row(children: [
                        Expanded(
                            flex: 7,
                            child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Lecture Name",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                      // height: 10,
                                      thickness: 2,
                                    ),
                                    Text(
                                      '${data.docs[index]['lecturer']}',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    )
                                  ],
                                ))),
                        Expanded(
                            flex: 3,
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                ),

                                // color: Colors.red[500],
                                child: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Time",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                          Divider(
                                            thickness: 2,
                                            color: Colors.black,
                                          ),
                                          Text(
                                            "MAE 30",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black),
                                          )
                                        ])))),
                      ]),
                    ));
              });
        }));
  }
}

class timetableItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.amber,
              border: Border.all(color: Colors.amber
                  // color: Colors.red[500],
                  ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: height15,
          width: logicalScreenSize.width,
          //   color: Colors.amber,
          child: Row(children: [
            Expanded(
                flex: 7,
                child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Lecturer"),
                        Divider(
                          color: Colors.white,
                          // height: 10,
                          thickness: 2,
                        ),
                        Text("Lecture name")
                      ],
                    ))),
            Expanded(
                flex: 3,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),

                    // color: Colors.red[500],
                    child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Time"),
                              Divider(
                                thickness: 2,
                                color: Colors.black,
                              ),
                              Text("MAE 30")
                            ])))),
          ]),
        ));
    // TODO: implement build
    // throw UnimplementedError();
  }
}
