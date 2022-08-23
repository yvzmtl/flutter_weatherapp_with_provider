import 'dart:convert';

import 'package:flutter_weatherapp_with_provider/models/weather.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static const baseUrl = "https://www.metaweather.com";
  final http.Client httpClient = http.Client();

  Future<int> getLocationID(String cityName) async {
    final cityUrl = baseUrl + "/api/location/search/?query=" + cityName;
    final gelenCevap = await httpClient.get(cityUrl);

    if (gelenCevap.statusCode != 200) {
      throw Exception("Veri getirilemedi");
    }

    final gelenCevapJSON = (jsonDecode(gelenCevap.body)) as List;
     print("burada 2 "+gelenCevapJSON[0]["woeid"].toString());
    return gelenCevapJSON[0]["woeid"];
  }

  Future<Weather> getWeather(int cityID) async {
    final weatherUrl = baseUrl + "/api/location/$cityID";
    final weatherResponse = await httpClient.get(weatherUrl);

    if (weatherResponse.statusCode != 200) {
      throw Exception("Veri getirilemedi");
    }

    final weatherresponseJSON = jsonDecode(weatherResponse.body);
    print("burada 1 "+weatherresponseJSON.toString());
    return Weather.fromJson(weatherresponseJSON);
  }
}
