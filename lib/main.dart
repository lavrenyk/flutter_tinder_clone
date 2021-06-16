import 'package:flutter/material.dart';
import 'package:tinder_clone/routes.dart';
import 'package:tinder_clone/screens/main_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'ProximaNova',
    ),
    initialRoute: MainScreen.routeName,
    routes: routes,
  ));
}
