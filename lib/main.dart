import 'package:flutter/material.dart';
import 'package:flutter_weatherapp_with_provider/locator.dart';
import 'package:flutter_weatherapp_with_provider/viewmodels/mytheme_view_model.dart';
import 'package:flutter_weatherapp_with_provider/viewmodels/weather_view_model.dart';
import 'package:flutter_weatherapp_with_provider/widget/weather_app.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(ChangeNotifierProvider(
      builder: (context) => MyThemeViewModel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<MyThemeViewModel>(
      builder: (context, MyThemeViewModel mythemeviewmodel, child) =>
          MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme:mythemeviewmodel.mytheme.theme,
              home: ChangeNotifierProvider<WeatherViewModel>(
                  builder: (context) => locator<WeatherViewModel>(),
                  child: WeatherApp())),
    );
  }
}
