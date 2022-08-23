import 'package:flutter_weatherapp_with_provider/data/weather_api_client.dart';
import 'package:flutter_weatherapp_with_provider/data/weather_repository.dart';
import 'package:flutter_weatherapp_with_provider/viewmodels/weather_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => WeatherRepository());
  locator.registerLazySingleton(() => WeatherApiClient());
  locator.registerFactory(() => WeatherViewModel());
}
