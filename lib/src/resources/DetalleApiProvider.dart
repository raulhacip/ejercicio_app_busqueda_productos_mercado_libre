import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../model/ConsultaModel.dart';

class DetalleApiProvider {
  Future<List<Results>> tomar_datos(var cadenaBusqueda) async {
    String url = 'api.mercadolibre.com';
    Map<String, String> headers = new HashMap();
    var queryParameters = {'q': cadenaBusqueda};
    headers['Authorization'] =
        'Bearer APP_USR-5919293016212967-072613-e72b7bf142fd617e671c2f1f1a43130d-78925214';

    var uri = Uri.https(url, '/sites/MCO/search', queryParameters);
    http.Response response = await http.get(uri, headers: headers);
    var datos = jsonDecode(response.body);
    print(datos);
    var registros = <Results>[];
    if (response.statusCode == 200) {
      for (final _results in datos["results"]) {
        registros.add(new Results.fromJson(_results));
      }
    } else {
      throw Exception('Fallo al conecterse');
    }

    return registros;
  }
}
