import 'package:flutter/material.dart';
import 'package:flutter_weatherapp_with_provider/models/weather.dart';

class MaxMinSicaklik extends StatelessWidget {
  ConsolidatedWeather consolidatedWeather;
  MaxMinSicaklik({this.consolidatedWeather});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          "Max Sıcaklık " +
              consolidatedWeather.maxTemp.floor().toString() +
              " °C",
          style: TextStyle(fontSize: 16),
        ),
        Text(
            "Min Sıcaklık " +
                consolidatedWeather.minTemp.floor().toString() +
                " °C",
            style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
