import 'package:ulke_baskent_quiz/Bayraklar.dart';
import 'package:ulke_baskent_quiz/VeritabaniYardimcisi.dart';

class Bayraklardao{
  Future<List<Bayraklar>> rastgele5Getir() async{
var db=await VeritabaniYardimcisi.veritabaniErisim();
List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM bayraklar ORDER BY RANDOM() LIMIT 15");
return List.generate(maps.length, (i)  {
  var satir = maps[i];
  return Bayraklar(satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_baskent"], satir["bayrak_resim"]);
});
  }
  Future<List<Bayraklar>> rastgele3YanlisGetir(int bayrak_id) async{
    var db=await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM bayraklar WHERE bayrak_id != $bayrak_id ORDER BY RANDOM() LIMIT 3");
    return List.generate(maps.length, (i)  {
      var satir = maps[i];
      return Bayraklar(satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_baskent"], satir["bayrak_resim"]);
    });
  }
}
