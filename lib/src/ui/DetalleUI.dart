// ignore_for_file: deprecated_member_use

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../model/ConsultaModel.dart';

class DetalleUI extends StatelessWidget {
  final Results results;

  DetalleUI({required this.results}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle del"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
                height: 54.0,
                padding: EdgeInsets.all(12.0),
                child: Text('Información del Producto',
                    style: TextStyle(fontWeight: FontWeight.w700))),
            Text('Producto: ${results.title}'),
            Text('Condición: ${results.condition}'),
            Text('Precio: ${results.price}'),
            Image(
              image: NetworkImage(results.thumbnail.toString()),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Regresar...'),
            ),
          ],
        ),
      ),
    );
  }
}
