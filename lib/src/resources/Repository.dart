import 'dart:async';
import 'DetalleApiProvider.dart';
import '../model/ConsultaModel.dart';

class Repository {
  final detalleApiProvider = DetalleApiProvider();

  Future<List<Results>> tomar_datos(var cadenaBusqueda) =>
      detalleApiProvider.tomar_datos(cadenaBusqueda);
}
