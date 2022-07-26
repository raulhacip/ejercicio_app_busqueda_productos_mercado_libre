import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(Aplicacion());
}

class Aplicacion extends StatefulWidget {
  @override
  _AplicacionState createState() => _AplicacionState();
}

class _AplicacionState extends State<Aplicacion> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => Home(),
      },
      initialRoute: '/home',
      debugShowCheckedModeBanner: false,
    );
  }
}
