import 'package:flutter/material.dart';
import 'package:ruthapp/pages/administracion/crear-tienda.dart';
import 'package:ruthapp/pages/administracion/suscribirse-tienda.dart';

class HomeInicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              _crearBotonNuevaTienda(context),
              _crearBotonSeleccionarTienda(context)
            ],
          )
        )        
      )
    );
  }

  Container _crearBotonNuevaTienda(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: RaisedButton(
          textColor: Colors.white,
          color: Colors.blue,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CrearTienda()));
          },
          child: Text('Crear nueva tienda')),
    );
  }

  Container _crearBotonSeleccionarTienda(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: RaisedButton(
          textColor: Colors.white,
          color: Colors.blue,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SuscribirseTienda()));
          },
          child: Text('Suscribirse a una tienda')),
    );
  }

}
