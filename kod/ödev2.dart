import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

  class MyApp extends StatelessWidget{

    Widget build(BuildContext context){
      return MaterialApp(
        home: Sayac(),
      );
    }
}


class Sayac extends StatefulWidget {

  @override
  _SayacState createState() => _SayacState();
}


class _SayacState extends State<Sayac>{
  double sayi=1;


    void carp(){
      setState(() {
        sayi*=2;
      });
    }

    void karekok(){
      setState(() {
        sayi = sqrt(sayi);
      });
    }
    void reset(){
      setState(() {
        sayi = 1;
      });
    }

    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: const Text("Odev 2"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Sayi: $sayi',
              style: const TextStyle(fontSize: 24),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton.large(
                    onPressed: carp,
                    child: const Center(
                      child: Text("2 ile Carp",
                      textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 23),
                      ),
                    ),
                  ),
                  FloatingActionButton.large(
                    onPressed: karekok,
                    child: const Center(
                      child: Text("Karekök Al",
                      textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 23),
                      ),
                    ),
                  ),
                  FloatingActionButton.large(
                    onPressed: reset,
                  child: const Center(
                    child: Text("Reset",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 23),
                    ),
                  ),

                  ),



                ],

              )

            ],
          )
        ),
      );
    }
}