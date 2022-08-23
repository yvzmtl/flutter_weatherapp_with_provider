

import 'package:flutter_weatherapp_with_provider/data/weather_api_client.dart';
import 'package:flutter_weatherapp_with_provider/locator.dart';
import 'package:flutter_weatherapp_with_provider/models/weather.dart';

class WeatherRepository {
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();

  Future<Weather> getWeather(String cityName) async {
    final int cityID = await weatherApiClient.getLocationID(cityName);
    print("burada 3"+cityID.toString());
    return await weatherApiClient.getWeather(cityID);
  }
}
