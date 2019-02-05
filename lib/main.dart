import 'package:flutter/material.dart';
import 'package:ruthapp/pages/login/crear-cuenta.dart';
import 'package:ruthapp/pages/login/login.dart';
import 'package:ruthapp/pages/productos/consulta-productos.dart';
import 'package:ruthapp/pages/productos/crear-producto.dart';
import 'package:ruthapp/ruthapp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'RuthApp',
        home: Login(),
        routes: <String, WidgetBuilder> {
          '/home': (BuildContext context) => RuthApp(),
          '/login/crear-cuenta': (BuildContext context) => CrearCuenta(),
          '/login/login': (BuildContext context) => Login(),
          '/productos/consulta-producto': (BuildContext context) => ConsultaProductos(),
          '/productos/crear-producto': (BuildContext context) => CrearProducto(),
        }        
      );
  }

}
