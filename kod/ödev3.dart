import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SplitScreen(),
      ),
    );
  }
}

class SplitScreen extends StatefulWidget {
  @override
  _SplitScreenState createState() => _SplitScreenState();
}

class _SplitScreenState extends State<SplitScreen> {
  Color leftBackgroundColor = Colors.white;
  Color rightBackgroundColor = Colors.white;
  Color leftTextColor = Colors.black;
  Color rightTextColor = Colors.black;

  void changeLeftColor() {
    setState(() {
      leftBackgroundColor = _generateRandomColor();
      leftTextColor = _calculateTextColor(leftBackgroundColor);
      _showColorChangeDialog(leftBackgroundColor);
    });
  }

  void changeRightColor() {
    setState(() {
      rightBackgroundColor = _generateRandomColor();
      rightTextColor = _calculateTextColor(rightBackgroundColor);
      _showColorChangeDialog(rightBackgroundColor);
    });
  }

  Color _generateRandomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
  }

  Color _calculateTextColor(Color backgroundColor) {
    final threshold = 128;
    final luminance =
        (0.299 * backgroundColor.red + 0.587 * backgroundColor.green + 0.114 * backgroundColor.blue);
    return luminance > threshold ? Colors.black : Colors.white;
  }

  Future<void> _showColorChangeDialog(Color color) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ekranın yeni rengi: ${color.toString()}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Kapat'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: leftBackgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Kişisel Bilgileriniz',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: leftTextColor,
                  ),
                ),
                ElevatedButton(
                  onPressed: changeLeftColor,
                  child: Text('Sol Tarafı Değiştir'),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: rightBackgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Memleketinizle İlgili Bilgi',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: rightTextColor,
                  ),
                ),
                ElevatedButton(
                  onPressed: changeRightColor,
                  child: Text('Sağ Tarafı Değiştir'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
