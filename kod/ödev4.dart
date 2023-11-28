import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kelime Üretici',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textController = TextEditingController();
  List<String> column1Words = [];
  List<String> column2Words = [];
  List<String> column3Words = [];

  void generateWords(int length) {
    String inputText = textController.text;

    // Harf kontrolü yap
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(inputText) || inputText.length < 6) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Uyarı"),
            content: Text("Yalnızca harf giriniz. Minimum 6 harf olmalıdır."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Tamam"),
              ),
            ],
          );
        },
      );
      return;
    }

    // Kelimeleri üret ve sütunlara ekle
    Random random = Random();
    List<String> words = [];
    for (int i = 0; i < 5; i++) {
      String word = "";
      for (int j = 0; j < length; j++) {
        int randomIndex = random.nextInt(inputText.length);
        word += inputText[randomIndex];
      }
      words.add(word);
    }

    setState(() {
      if (length == 4) {
        column1Words = words;
      } else if (length == 5) {
        column2Words = words;
      } else if (length == 6) {
        column3Words = words;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelime Üretici'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(labelText: 'Harf Girişi'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => generateWords(4),
              child: Text('4 Harfli Kelimeleri Üret'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => generateWords(5),
              child: Text('5 Harfli Kelimeleri Üret'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => generateWords(6),
              child: Text('6 Harfli Kelimeleri Üret'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sütun 1'),
                    ...column1Words.map((word) => Text(word)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sütun 2'),
                    ...column2Words.map((word) => Text(word)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sütun 3'),
                    ...column3Words.map((word) => Text(word)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
