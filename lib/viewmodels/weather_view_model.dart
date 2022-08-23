import 'package:flutter/material.dart';
import 'package:flutter_weatherapp_with_provider/data/weather_repository.dart';
import 'package:flutter_weatherapp_with_provider/locator.dart';
import 'package:flutter_weatherapp_with_provider/models/weather.dart';

enum WeatherState {
  InitialWeatherState,
  WeatherLoadingState,
  WeatherLoadedState,
  WeatherErrorState
}

class WeatherViewModel with ChangeNotifier {
  WeatherState _state;
  WeatherRepository _repository = locator<WeatherRepository>();
  Weather _getirilenweather;

  Weather get getirilenweather => _getirilenweather;

  WeatherViewModel() {
    _getirilenweather = Weather();
    _state = WeatherState.InitialWeatherState;
  }

  WeatherState get state => _state;

  set state(WeatherState _mystate) {
    this._state = _mystate;
    notifyListeners();
  }

  Future<Weather> havaDurumunuGetir(String cityName) async {
    try {//dogrusu bu
      state = WeatherState.WeatherLoadingState;
      _getirilenweather = await _repository.getWeather(cityName);
      print("burada 555555 "+_getirilenweather.consolidatedWeather[0].airPressure.floor().toString());
      state = WeatherState.WeatherLoadedState;
    } catch (e) {
      print("burada 4 hata var :"+e.toString());
      state = WeatherState.WeatherErrorState;
    }
    return _getirilenweather;
  }

  Future<Weather> havaDurumunuGuncelle(String cityName) async {
    try {
      _getirilenweather = await _repository.getWeather(cityName);
      state = WeatherState.WeatherLoadedState;
    } catch (e) {
    }
    return _getirilenweather;
  }

  String havaDurumuKisaltmasi(){
    return _getirilenweather.consolidatedWeather[0].weatherStateAbbr;
  }
}
