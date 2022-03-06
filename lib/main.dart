import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:html';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController textFieldController = TextEditingController();
  double C = 0.0;
  double R = 0.0;
  double K = 0.0;

  countReamur(){
    setState(() {
      C = double.parse(textFieldController.text);
      R = (4 * C) / 5;
    });
  }

  countKelvin(){
    setState(() {
      C = double.parse(textFieldController.text);
      K = C + 273.15;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      ),
      home:Scaffold(
        appBar: AppBar(
        title: Text("Konverter Suhu"),
        ),
      body: Container(
        child: Column(
          children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
            controller: textFieldController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Masukan Suhu Dalam Celcius',
            ),
            validator: (value){
              if(value == String){
                return 'Inputan yang di ijinkan hanya angka';
              }
              return null;
            },
          ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("Suhu Dalam Kelvin"),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text("$K", style: TextStyle(fontSize: 30),),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text("Suhu Dalam Reamur"),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text("$R", style: TextStyle(fontSize: 30),),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 200),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50), // fromHeight use double.infinity as width and 40 is the height
              ),
                onPressed: () {
                  countKelvin();
                  countReamur();
                  textFieldController.clear();
                },
                child: Text("Konversi Suhu")
              
              ),
            ),
          )
        ],
        ),
      ),
      
      ),
    );
  }
}