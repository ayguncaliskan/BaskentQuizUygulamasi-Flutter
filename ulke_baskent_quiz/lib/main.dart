import 'package:flutter/material.dart';

import 'QuizEkrani.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "QUİZE HOŞGELDİNİZ",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: RaisedButton(
                child: Text("BAŞLA"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizEkrani()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
