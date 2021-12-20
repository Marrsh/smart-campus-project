import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("height is $logicalScreenSize");
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.amber), // declare theme data for this widget?
      home: Scaffold(//Like stacks in swift, takes in the elements of the widget (body, appbar etc..)
        appBar: AppBar(title: Center(child: Text('University Name'))),
      body: _NavBar(),
        )
      );

  }
}

class _NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: logicalScreenSize.width,
                height: height10,
                color: Colors.blue,
                child: Row(
                  children: [
                    _NavButton(),
                    _NavButton(),
                    _CentralNavButton(),
                    _NavButton(),
                    _NavButton()
                  ],
                ),
              )
          ),
        ],
    );
  }
}

class _NavButton extends StatelessWidget {

  Widget build(BuildContext context) {
    return Container(
            width: height10,
            height: height10,
            color: Colors.amber,
            margin: const EdgeInsets.only(left:3),
    );
  }
}

class _CentralNavButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.yellow,
      shape: CircleBorder(),
      onPressed: () {},
        child: Text(
          'A circle button',
          style: TextStyle(color: Colors.white, fontSize: 5),
      ),
    );
  }
}