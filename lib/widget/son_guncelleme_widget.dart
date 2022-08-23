import 'package:flutter/material.dart';
import 'package:flutter_weatherapp_with_provider/viewmodels/weather_view_model.dart';
import 'package:provider/provider.dart';

class SonGuncellemeWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
       final _weatherviewmodel = Provider.of<WeatherViewModel>(context);
       var yenitarih = _weatherviewmodel.getirilenweather.time.toLocal();
    return Container(
      child: Text(
        "Son Güncelleme  " + TimeOfDay.fromDateTime(yenitarih).format(context),
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
