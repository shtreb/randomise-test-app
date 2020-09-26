import 'package:flutter/material.dart';

import 'package:randomiser/data/gateway.dart';
import 'package:randomiser/domain/cases/services/info-service.dart';
import 'package:randomiser/domain/flavors/flavor.dart';
import 'package:randomiser/domain/flavors/main-flavor.dart';
import 'package:randomiser/presenter/ui/screens/main-list.dart';

void main() {
  runApp(MyApp(MainFlavor()));
}

Gateway gateway;
InfoService infoService;

class MyApp extends StatefulWidget {
  final Flavor flavor;

  MyApp(this.flavor);

  @override _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  ColorPalette light;
  ColorPalette dark;

  ThemeData theme = ThemeData(
    visualDensity: VisualDensity.standard,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white)
      )
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 16,
      ),
      bodyText2: TextStyle(
        fontSize: 14,
      )
    )
  );

  @override void initState() {
    light = widget.flavor.lightPalette;
    dark = widget.flavor.darkPalette;

    gateway = Gateway(widget.flavor.baseApi);
    infoService = InfoService();

    infoService.loadNextItems();

    super.initState();
  }

  @override Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Randomiser',
      theme: theme.copyWith(
        scaffoldBackgroundColor: light.scaffold,
        primaryColor: light.colorPrimary,
        primaryColorDark: light.colorPrimaryDark,
        accentColor: light.colorAccent,
        textTheme: theme.textTheme.copyWith(
          bodyText1: theme.textTheme.bodyText1.copyWith(color: Colors.black),
          bodyText2: theme.textTheme.bodyText1.copyWith(color: Colors.grey[600])
        )
      ),
      darkTheme: theme.copyWith(
        scaffoldBackgroundColor: dark.scaffold,
        primaryColor: dark.colorPrimary,
        primaryColorDark: dark.colorPrimaryDark,
        accentColor: dark.colorAccent,
        textTheme: theme.textTheme.copyWith(
          bodyText1: theme.textTheme.bodyText1.copyWith(color: Colors.white),
          bodyText2: theme.textTheme.bodyText1.copyWith(color: Colors.grey[400])
        )
      ),
      home: MainList(),
    );
  }

  @override void dispose() {
    infoService.dispose();
    super.dispose();
  }

}