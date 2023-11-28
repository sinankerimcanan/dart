import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String enteredText = '';
  double fontSize = 20.0;
  Color randomColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Detector Example'),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            color: randomColor,
            child: GestureDetector(
              onDoubleTap: () {
                setState(() {
                  fontSize = (fontSize == 20.0) ? 40.0 : 20.0;
                });
              },
              onLongPress: () {
                setState(() {
                  fontSize = 20.0;
                });
              },
              child: Center(
                child: Text(
                  enteredText,
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      randomColor = _getRandomColor();
                    });
                  },
                  child: Container(
                    color: _getRandomColor(),
                    margin: EdgeInsets.all(4),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open a dialog to get user input
          _showInputDialog(context);
        },
        child: Icon(Icons.edit),
      ),
    );
  }

  Color _getRandomColor() {
    Random random = new Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }

  Future<void> _showInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Text'),
          content: TextField(
            onChanged: (value) {
              setState(() {
                enteredText = value;
              });
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
