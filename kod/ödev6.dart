import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

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
  String xValues = ''; // Kullanıcının girdiği x değerleri
  String yValues = ''; // Kullanıcının girdiği y değerleri

  bool validateValues(String values) {
    List<String> valueList = values.split(' ');

    for (String value in valueList) {
      if (!RegExp(r'^\d+$').hasMatch(value)) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grafik Uygulaması'),
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'grafikBilgileri',
                  child: Text('Grafik Bilgileri'),
                ),
                PopupMenuItem<String>(
                  value: 'grafik',
                  child: Text('Grafik'),
                ),
              ];
            },
            onSelected: (String value) {
              if (value == 'grafik') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GraphPage(
                      xValues: xValues,
                      yValues: yValues,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'X Değerleri'),
              onChanged: (value) {
                if (!validateValues(value)) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Hata'),
                        content:
                            Text('Lütfen sadece sayıları ve boşlukları kullanın.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Tamam'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  xValues = value;
                }
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Y Değerleri'),
              onChanged: (value) {
                yValues = value;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'X Ekseni İsmi'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Y Ekseni İsmi'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Grafiği çizme işlemi için henüz bir şey yapmıyoruz,
                // çünkü grafiği çizme işlemini GraphPage'de gerçekleştireceğiz.
              },
              child: Text('Grafiği Çiz'),
            ),
          ],
        ),
      ),
    );
  }
}

class GraphPage extends StatelessWidget {
  final String xValues;
  final String yValues;

  GraphPage({required this.xValues, required this.yValues});

  @override
  Widget build(BuildContext context) {
    List<double> xList = xValues.split(' ').map((e) => double.parse(e)).toList();
    List<double> yList = yValues.split(' ').map((e) => double.parse(e)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Grafik'),
      ),
      body: Container(
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: List.generate(
                  xList.length,
                  (index) => FlSpot(xList[index], yList[index]),
                ),
                isCurved: true,
                colors: [Colors.blue],
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
            ],
            titlesData: FlTitlesData(
              leftTitles: SideTitles(showTitles: true),
              bottomTitles: SideTitles(showTitles: true),
            ),
            gridData: FlGridData(show: true),
          ),
        ),
      ),
    );
  }
}
