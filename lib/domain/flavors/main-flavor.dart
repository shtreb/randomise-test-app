import 'package:flutter/material.dart';
import 'package:randomiser/domain/flavors/flavor.dart';

class MainFlavor extends Flavor {

  MainFlavor() {
    baseApi = 'https://randomuser.me/';

    lightPalette = ColorPalette(
      colorPrimary: Colors.blue,
      colorPrimaryDark: Colors.blue[600],
      colorAccent: Colors.white,
      colorIcon: Colors.white,
      scaffold: Colors.grey[100]
    );

    darkPalette = ColorPalette(
        colorPrimary: Colors.blue[800],
        colorPrimaryDark: Colors.blue[900],
        colorAccent: Colors.white,
        colorIcon: Colors.white,
        scaffold: Colors.grey[700]
    );
  }

}