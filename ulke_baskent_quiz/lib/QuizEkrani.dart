import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:ulke_baskent_quiz/Bayraklar.dart';
import 'package:ulke_baskent_quiz/Bayraklardao.dart';
import 'package:ulke_baskent_quiz/SonucEkrani.dart';

class QuizEkrani extends StatefulWidget {
  @override
  _QuizEkraniState createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {

  var sorular = List<Bayraklar>();
  var yanlisSecenekler = List<Bayraklar>();
  Bayraklar dogruSoru;
  var tumSecenekler = HashSet<Bayraklar>();
  int soruSayac = 0;
  int dogruSayac = 0;
  int yanlisSayac = 0;
  String bayrakResimAdi = "placeholder.png";
  String bayrakUlkeAdi;
  String buttonAyazi = "";
  String buttonByazi = "";
  String buttonCyazi = "";
  String buttonDyazi = "";

  @override
  void initState() {
    super.initState();
sorulariAl();
  }

  Future<void> sorulariAl() async {
    sorular = await Bayraklardao().rastgele5Getir();
    soruYukle();
  }

  Future<void> soruYukle() async {
    dogruSoru = sorular[soruSayac];
    bayrakResimAdi = dogruSoru.bayrak_resim;
    bayrakUlkeAdi=dogruSoru.bayrak_ad;
    yanlisSecenekler =
    await Bayraklardao().rastgele3YanlisGetir(dogruSoru.bayrak_id);
    tumSecenekler.clear();
    tumSecenekler.add(dogruSoru);
    tumSecenekler.add(yanlisSecenekler[0]);
    tumSecenekler.add(yanlisSecenekler[1]);
    tumSecenekler.add(yanlisSecenekler[2]);

    buttonAyazi = tumSecenekler
        .elementAt(0)
        .bayrak_baskent;
    buttonByazi = tumSecenekler
        .elementAt(1)
        .bayrak_baskent;
    buttonCyazi = tumSecenekler
        .elementAt(2)
        .bayrak_baskent;
    buttonDyazi = tumSecenekler
        .elementAt(3)
        .bayrak_baskent;
    setState(() {

    });
  }
void soruSayacKontrol(){
  soruSayac=soruSayac +1;
  if(soruSayac !=15){
    soruYukle();
  }else{
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => SonucEkrani(dogruSayisi: dogruSayac,)));
  }
}
void dogruKontrol(String buttonYazi){
  if(dogruSoru.bayrak_baskent==buttonYazi){
    dogruSayac=dogruSayac+1;
  }
  else{
    yanlisSayac=yanlisSayac+1;
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Doğru : $dogruSayac", style: TextStyle(fontSize: 18),),
                Text("Yanlış : $yanlisSayac", style: TextStyle(fontSize: 18),),
              ],
            ),
            soruSayac != 15 ? Text(
              "${soruSayac + 1}.Soru", style: TextStyle(fontSize: 30),) :
            Text("15.Soru", style: TextStyle(fontSize: 30),),
            Image.asset("resimler/$bayrakResimAdi"),
            Text("${bayrakUlkeAdi}",style: TextStyle(fontSize: 30),),

            SizedBox(
              width: 250,
              height: 50,
              child: RaisedButton(
                child: Text(buttonAyazi,style: TextStyle(fontSize: 20) ,),

                onPressed: () {
                  dogruKontrol(buttonAyazi);
                  soruSayacKontrol();
                },
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: RaisedButton(
                child: Text(buttonByazi,style: TextStyle(fontSize: 20) ,),
                onPressed: () {
                  dogruKontrol(buttonByazi);
                  soruSayacKontrol();
                },
              ),
            ), SizedBox(
              width: 250,
              height: 50,
              child: RaisedButton(
                child: Text(buttonCyazi,style: TextStyle(fontSize: 20) ,),
                onPressed: () {
                  dogruKontrol(buttonCyazi);
                  soruSayacKontrol();
                },
              ),
            ), SizedBox(
              width: 250,
              height: 50,
              child: RaisedButton(
                child: Text(buttonDyazi,style: TextStyle(fontSize: 20) ,),
                onPressed: () {
                  dogruKontrol(buttonDyazi);
                  soruSayacKontrol();

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

