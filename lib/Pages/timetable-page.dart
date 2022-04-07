import 'package:flutter/material.dart';
import '../bottom-nav-bar.dart';
import '../constants.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mock_data/mock_data.dart';
// import 'package:intl/intl.dart'

class TimetablePage extends StatelessWidget {
  // const TimetablePage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(child: Text('University Name')),
            backgroundColor: yellow,
            foregroundColor: Colors.black),
        body: Column(children: [
          Expanded(child: TimeTableList()),
          Positioned(bottom: 0, child: NavBar())
        ]));
  }
}

// ignore: non_constant_identifier_names
DateDivider(DateTime date) {
  String displayDate = "";
  if (date.weekday == DateTime.now().weekday) {
    displayDate = "Today";
  } else {
    switch (date.weekday) {
      case 1:
        displayDate = "Monday";
        break;
      case 2:
        displayDate = "Tuesday";
        break;
      case 3:
        displayDate = "Wednesday";
        break;
      case 4:
        displayDate = "Thursday";
        break;
      case 5:
        displayDate = "Friday";
        break;
      case 6:
        displayDate = "Saturday";
        break;
      case 7:
        displayDate = "Sunday";
        break;
      default:
        displayDate = "Today";
    }
  }
  return (Padding(
      padding: EdgeInsets.all(mdPadding),
      child: Column(
        children: [
          Text(displayDate,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 22, color: Colors.black)),
          Divider(
            thickness: 2,
            color: Colors.amber,
          ),
        ],
      )));
}

uploadItem() {
  CollectionReference items =
      FirebaseFirestore.instance.collection('Timetable');
  // String state = '';
  // var name = mockName();
  // for (int i = 5; i <= 26; i + 7) {
  items.doc().set({
    'lecturer': "Prof. Matrices",
    'lecture_name': 'Maths Lecture',
    'room': "Lecture Theatre 2",
    'time': DateTime(2022, 4, 06, 11)
  });
  // var day = i;
}

// class ItemsList extends StatelessWidget {
//   final Stream<QuerySnapshot> users = FirebaseFirestore.instance
//       .collection('Timetable')
//       .orderBy("time")
//       .where('time', isGreaterThanOrEqualTo: Timestamp.fromDate(DateTime.now()))
//       .where('time',
//           isLessThan: Timestamp.fromDate(DateTime.now().add(Duration(days: 6))))
//       //     isLessThan:
//       //     Timestamp.fromDate( DateTime.now().add(Duration(days: 6)))
//       .snapshots();
//   var epoch = DateTime.now().millisecondsSinceEpoch * 1000;
//   @override
//   Widget build(BuildContext context) {
//     // uploadItem();
//     return (StreamBuilder(
//         stream: users,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text('error');
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Text('Loading...');
//           }
//           final data = snapshot.requireData;
//           // data.forEach()
//           var currentDate = DateTime.now();
//           return ListView.builder(
//               scrollDirection: Axis.vertical,
//               shrinkWrap: true,
//               itemCount: data.size,
//               itemBuilder: (context, index) {
//                 // if (DateTime.parse(data.docs[index]['time'].toDate())
//                 //     .isAfter(currentDate)) {
//                 //   currentDate = data.docs[index]['time'].toDate();
//                 //   DateDivider(currentDate);
//                 // } else {
//                 //   return (Stack());
//                 // }

//                 // if is within the week

//                 // if (DateTime.parse(data.docs[index]['time'].toDate().toString())
//                 //         .isAfter(DateTime.now().add(Duration(days: -1))) &&
//                 //     DateTime.parse(data.docs[index]['time'].toDate().toString())
//                 //         .isBefore(DateTime.now().add(Duration(days: 6)))) {
//                 // return
//                 // if ()
//                 return Padding(
//                     padding: EdgeInsets.all(5),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: Colors.amber,
//                           border: Border.all(color: Colors.amber
//                               // color: Colors.red[500],
//                               ),
//                           borderRadius: BorderRadius.all(Radius.circular(20))),
//                       height: height15,
//                       width: logicalScreenSize.width,
//                       //   color: Colors.amber,
//                       child: Row(children: [
//                         Expanded(
//                             flex: 7,
//                             child: Padding(
//                                 padding: EdgeInsets.all(15),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       '${data.docs[index]['lecture_name']}',
//                                       style: const TextStyle(
//                                           fontSize: 12, color: Colors.black),
//                                     ),
//                                     const Divider(
//                                       color: Colors.white,
//                                       // height: 10,
//                                       thickness: 2,
//                                     ),
//                                     Text(
//                                       '${data.docs[index]['lecturer']}',
//                                       style: const TextStyle(
//                                           fontSize: 12, color: Colors.black),
//                                     )
//                                   ],
//                                 ))),
//                         Expanded(
//                             flex: 3,
//                             child: Container(
//                                 decoration: const BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.only(
//                                       topRight: Radius.circular(20),
//                                       bottomRight: Radius.circular(20)),
//                                 ),

//                                 // color: Colors.red[500],
//                                 child: Padding(
//                                     padding: EdgeInsets.all(15),
//                                     child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Text(
//                                             '${DateTime.parse(data.docs[index]['time'].toDate().toString())}',
//                                             style: const TextStyle(
//                                                 fontSize: 12,
//                                                 color: Colors.black),
//                                           ),
//                                           const Divider(
//                                             thickness: 2,
//                                             color: Colors.black,
//                                           ),
//                                           Text(
//                                             '${data.docs[index]['room']}',
//                                             style: const TextStyle(
//                                                 fontSize: 12,
//                                                 color: Colors.black),
//                                           )
//                                         ])))),
//                       ]),
//                     ));
//                 // ]);
//               }
//               //.toDate().day.isBefore(DateTime.now().day + 6) &&
//               //     currentDate.toDate().day.isAfter(DateTime.now())) {
//               // if (currentDate
//               //     .toDate()
//               //     .day
//               //     .isBetween(DateTime.now().day, DateTime.now().day + 6)) {

//               );
//         }));
//   }
// }

class TimeTableList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DateDivider(DateTime.now()),
        TimetableItem("lecture name", "lecturer", "room no", "time"),
        TimetableItem("lecture name", "lecturer", "room no", "time"),
        DateDivider(DateTime.now().add(Duration(days: 1))),
        TimetableItem("lecture name", "lecturer", "room no", "time"),
        TimetableItem("lecture name", "lecturer", "room no", "time"),
        DateDivider(DateTime.now().add(Duration(days: 5))),
        TimetableItem("lecture name", "lecturer", "room no", "time"),
        TimetableItem("lecture name", "lecturer", "room no", "time"),
      ],
    );
  }
}

TimetableItem(lecturer, lectureName, room, time) {
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
                        lectureName,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      const Divider(
                        color: Colors.white,
                        // height: 10,
                        thickness: 2,
                      ),
                      Text(
                        lecturer,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.black),
                      )
                    ],
                  ))),
          Expanded(
              flex: 3,
              child: Container(
                  decoration: const BoxDecoration(
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
                            Text(
                              time,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black),
                            ),
                            const Divider(
                              thickness: 2,
                              color: Colors.black,
                            ),
                            Text(
                              room,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black),
                            )
                          ])))),
        ]),
      ));
  // TODO: implement build
  // throw UnimplementedError();
}
