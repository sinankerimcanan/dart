//Stateless
import 'package:flutter/material.dart';

class MyInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('İsim: Adınız', style: TextStyle(fontSize: 18)),
        Text('Soyisim: Soyadınız', style: TextStyle(fontSize: 18)),
        Text('Memleket: Memleketiniz', style: TextStyle(fontSize: 18)),
        Text('Doğum Tarihi: DD/MM/YYYY', style: TextStyle(fontSize: 18)),
        Text('Öğrenci Numarası: Öğrenci Numaranız', style: TextStyle(fontSize: 18)),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('My Info')),
      body: MyInfoWidget(),
    ),
  ));
}
//Stateful
import 'package:flutter/material.dart';
import 'dart:math';

class NumberManipulatorWidget extends StatefulWidget {
  @override
  _NumberManipulatorWidgetState createState() => _NumberManipulatorWidgetState();
}

class _NumberManipulatorWidgetState extends State<NumberManipulatorWidget> {
  double number = 1.0;

  void doubleNumber() {
    setState(() {
      number *= 2;
    });
  }

  void squareRootNumber() {
    setState(() {
      number = sqrt(number);
    });
  }

  void resetNumber() {
    setState(() {
      number = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Number: $number', style: TextStyle(fontSize: 24)),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: doubleNumber, child: Text('Double')),
            SizedBox(width: 10),
            ElevatedButton(onPressed: squareRootNumber, child: Text('Square Root')),
            SizedBox(width: 10),
            ElevatedButton(onPressed: resetNumber, child: Text('Reset')),
          ],
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Number Manipulator')),
      body: NumberManipulatorWidget(),
    ),
  ));
}