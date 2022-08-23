import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_weatherapp_with_provider/viewmodels/mytheme_view_model.dart';
import 'package:flutter_weatherapp_with_provider/viewmodels/weather_view_model.dart';
import 'package:flutter_weatherapp_with_provider/widget/gecisli_arkaplan_renk.dart';
import 'package:flutter_weatherapp_with_provider/widget/haca_durumu_resim.dart';
import 'package:flutter_weatherapp_with_provider/widget/location.dart';
import 'package:flutter_weatherapp_with_provider/widget/max_min_sicaklik.dart';
import 'package:flutter_weatherapp_with_provider/widget/sehir_sec.dart';
import 'package:flutter_weatherapp_with_provider/widget/son_guncelleme_widget.dart';
import 'package:provider/provider.dart';

class WeatherApp extends StatelessWidget {
  String selectedCity = "Ankara";
  WeatherViewModel _weatherViewModel;
  MyThemeViewModel _myThemeViewModel;

  @override
  Widget build(BuildContext context) {
    _weatherViewModel = Provider.of<WeatherViewModel>(context);
    _myThemeViewModel = Provider.of<MyThemeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              selectedCity = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SehirSecWidget()));
              debugPrint("seçilen şehir : " + selectedCity);
              _weatherViewModel.havaDurumunuGetir(selectedCity);
            },
          ),
        ],
      ),
      body: Center(
          child: (_weatherViewModel.state == WeatherState.WeatherLoadedState)
              ? HavaDurumuGeldi()
              : (_weatherViewModel.state == WeatherState.WeatherLoadingState)
                  ? havaDurumuGetiriliyor()
                  : (_weatherViewModel.state == WeatherState.WeatherErrorState)
                      ? havaDurumuGetirHata()
                      : Text("Şehir Seçiniz")),
    );
  }

  havaDurumuGetiriliyor() {
    return CircularProgressIndicator();
  }

  havaDurumuGetirHata() {
    return Center(child: Text("Hava Durumu Getirilirken Hata Oluştu"));
  }
}

class HavaDurumuGeldi extends StatefulWidget {
  @override
  _HavaDurumuGeldiState createState() => _HavaDurumuGeldiState();
}

class _HavaDurumuGeldiState extends State<HavaDurumuGeldi> {
  WeatherViewModel _weatherViewModel;
  MyThemeViewModel _myThemeViewModel;
  Completer<void> _refreshIndicator;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshIndicator = Completer<void>();
    debugPrint("init state tetiklendi");
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      var kisaltma =
          Provider.of<WeatherViewModel>(context).havaDurumuKisaltmasi();
      debugPrint("hava durumu kısaltması = " + kisaltma);
      Provider.of<MyThemeViewModel>(context).changeTheme(kisaltma);
    });
  }

  @override
  Widget build(BuildContext context) {
    _refreshIndicator.complete();
    _refreshIndicator = Completer<void>();
    _weatherViewModel = Provider.of<WeatherViewModel>(context);
    _myThemeViewModel = Provider.of<MyThemeViewModel>(context);
    String selectedCity = _weatherViewModel.getirilenweather.title;
    debugPrint("max sıcaklık :"+_weatherViewModel.getirilenweather.consolidatedWeather[0].maxTemp.floor().toString());
    return GecisliRenkContainer(
      color: Provider.of<MyThemeViewModel>(context).mytheme.color,
      child: RefreshIndicator(
        onRefresh: () {
          _weatherViewModel.havaDurumunuGuncelle(selectedCity);
          return _refreshIndicator.future;
        },
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: LocationWidget(
                selectedCity: selectedCity,
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: SonGuncellemeWidget()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: HavaDurumuResim()),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                  child: MaxMinSicaklik(
                consolidatedWeather:
                    _weatherViewModel.getirilenweather.consolidatedWeather[0],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
