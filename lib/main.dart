import 'package:flutter/material.dart';
import 'package:ruthapp/administracion/administracion-tienda.dart';
import 'package:ruthapp/administracion/cliente/administrar-clientes.dart';
import 'package:ruthapp/administracion/productos/consulta-productos.dart';
import 'package:ruthapp/administracion/productos/crear-producto.dart';
import 'package:ruthapp/administracion/tienda/crear-tienda.dart';
import 'package:ruthapp/autenticacion/crear-cuenta.dart';
import 'package:ruthapp/autenticacion/login.dart';
import 'package:ruthapp/cliente/comprar-producto.dart';
import 'package:ruthapp/cliente/suscribirse-tienda.dart';
import 'package:ruthapp/general/administracion-usuario.dart';
import 'package:ruthapp/general/home-inicio.dart';
import 'package:ruthapp/presentacion/presentacion.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'RuthApp',
        home: Login(),
        routes: <String, WidgetBuilder> {
          '/administracion/productos/consulta-producto' : (BuildContext context) => ConsultaProductos(),
          '/administracion/productos/crear-producto' : (BuildContext context) => CrearProducto(),
          '/administracion/cliente/administrar-clientes' : (BuildContext context) => AdministrarClientes(),
          '/administracion/tienda/crear-tienda' : (BuildContext context) => CrearTienda(),
          '/administracion/administracion-tienda' : (BuildContext context) => AdministracionTienda(),
          '/autenticacion/crear-cuenta' : (BuildContext context) => CrearCuenta(),
          '/autenticacion/login' : (BuildContext context) => Login(),
          '/cliente/comprar-producto' : (BuildContext context) => ComprarProducto(),
          '/cliente/suscribirse-tienda' : (BuildContext context) => SuscribirseTienda(),
          '/general/administracion-usuario' : (BuildContext context) => AdministracionUsuario(),
          '/general/home-inicio' : (BuildContext context) => HomeInicio(),
          '/presentacion/presentacion' : (BuildContext context) =>  Presentacion()
        }        
      );
  }

}
