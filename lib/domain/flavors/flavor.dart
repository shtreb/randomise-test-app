import 'package:flutter/material.dart';

abstract class Flavor {

  String baseApi;
  ColorPalette lightPalette;
  ColorPalette darkPalette;

}

class ColorPalette {
  Color colorPrimary;
  Color colorPrimaryDark;
  Color colorAccent;
  Color colorIcon;
  Color scaffold;

  ColorPalette({
    Color colorPrimary,
    Color colorPrimaryDark,
    Color colorAccent,
    Color colorIcon,
    Color scaffold,
  }) :
      colorPrimary = colorPrimary ?? Colors.black,
      colorPrimaryDark = colorPrimaryDark ?? Colors.black,
      colorAccent = colorAccent ?? Colors.white,
      colorIcon = colorIcon ?? Colors.white,
      scaffold = scaffold ?? Colors.grey[700];
}