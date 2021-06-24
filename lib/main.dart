import 'package:examen_tendencias/views/hero_detalle.dart';
import 'package:examen_tendencias/views/home.dart';
import 'package:flutter/material.dart';
import 'views/NavBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Heroes.',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: Colors.red[900],
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.white),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => HomePage(),
          'detalle': (BuildContext context) => HeroDetalle(),
        });
  }
}
