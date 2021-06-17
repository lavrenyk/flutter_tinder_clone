import 'package:flutter/material.dart';
import 'package:tinder_clone/routes.dart';
import 'package:tinder_clone/screens/main_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('ru'),
      const Locale('en'),
    ],
    locale: const Locale('ru'),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'ProximaNova',
    ),
    initialRoute: MainScreen.routeName,
    routes: routes,
  ));
}
