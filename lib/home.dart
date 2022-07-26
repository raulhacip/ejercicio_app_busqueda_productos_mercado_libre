import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prueba/src/resources/Repository.dart';
import 'dart:async';
import 'dart:convert';
import 'src/model/ConsultaModel.dart';
import 'src/ui/DetalleUI.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: deprecated_member_use, prefer_collection_literals
  List<Results> data = <Results>[];
  var cadenaBusqueda = '';
  final _repository = Repository();

  // ignore: non_constant_identifier_names
  Future<List<Results>> tomar_datos(var cadenaBusqueda) =>
      _repository.tomar_datos(cadenaBusqueda);

  @override
  void initState() {
    super.initState();
    /*
    tomar_datos().then((value) {
      setState(() {
        data.addAll(value);
      });
    });
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Productos'),
      ),
      body: Column(children: [
        TextField(
          decoration: InputDecoration(
              hintText: 'ingrese nombre del producto',
              filled: true,
              prefixIcon: Icon(
                Icons.account_box,
                size: 28.0,
              ),
              suffixIcon: IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    data.clear();
                    tomar_datos(this.cadenaBusqueda).then((value) {
                      setState(() {
                        data.addAll(value);
                      });
                    });
                  })),
          onChanged: (text) {
            print("First text field: $text");
            this.cadenaBusqueda = '$text';
          },
        ),
        Expanded(
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        Text(
                          data[index].title.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(data[index].price.toString()),
                        Image(
                          image: NetworkImage(data[index].thumbnail.toString()),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FlatButton(
                                onPressed: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetalleUI(
                                                results: data[index])),
                                      )
                                    },
                                child: Text('Detalle del Producto')),
                          ],
                        )
                      ],
                    ),
                  );
                }))
      ]),
    );
  }
}
