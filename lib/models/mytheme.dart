import 'package:flutter/material.dart';

class MyTheme {
  MaterialColor _color;
  ThemeData _theme;

  MaterialColor get color => _color;

  set color(MaterialColor color) {
    this._color = color;
  }

  ThemeData get theme => _theme;

  set theme(ThemeData theme) {
    this._theme = theme;
  }

  MyTheme(this._color,this._theme);
}
