import 'package:flutter/material.dart';
import 'package:flutter_weatherapp_with_provider/viewmodels/weather_view_model.dart';
import 'package:provider/provider.dart';

class HavaDurumuResim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _weatherviewModel = Provider.of<WeatherViewModel>(context);
    var havaDurumuKisatlmasi = _weatherviewModel
        .getirilenweather.consolidatedWeather[0].weatherStateAbbr;
    return Column(
      children: <Widget>[
        Text(
          _weatherviewModel.getirilenweather.consolidatedWeather[0].theTemp
                  .floor()
                  .toString() +
              " °C",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        Image.network(
          "https://www.metaweather.com/static/img/weather/png/" +
              havaDurumuKisatlmasi +
              ".png",
          width: 150,
          height: 150,
        ),
      ],
    );
  }
}
