import 'package:flutter/material.dart';
import 'package:flutter_weatherapp_with_provider/models/mytheme.dart';

class MyThemeViewModel with ChangeNotifier {
  MyTheme _myTheme;

  MyThemeViewModel() {
    _myTheme = MyTheme(Colors.blue, ThemeData.light());
  }

  MyTheme get mytheme => _myTheme;

  set mytheme(MyTheme mytheme) {
    _myTheme = mytheme;
    notifyListeners();
  }

  void changeTheme(String havaDurumuKisatlmasi) {
    MyTheme _geciciTheme;
    switch (havaDurumuKisatlmasi) {
      case "sn": //karlı
      case "sl": //sulu kar
      case "h": //dolu
      case "t": //fırtına
      case "hc": //çok bulutlu
        _geciciTheme =
            MyTheme(Colors.grey, ThemeData(primaryColor: Colors.blueGrey));
        break;
      case "hr": //ağır yağmurlu
      case "lr": //hafif yağmurlu
      case "s": //sağanak yağış
        _geciciTheme = MyTheme(
            Colors.indigo, ThemeData(primaryColor: Colors.indigoAccent));
        break;
      case "lc": //az bulutlu
      case "c": //açık güneşli hava
        _geciciTheme = MyTheme(
            Colors.yellow, ThemeData(primaryColor: Colors.orangeAccent));
        break;
    }
    mytheme = _geciciTheme;
  }
}
