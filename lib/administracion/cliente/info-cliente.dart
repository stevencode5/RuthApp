import 'package:flutter/material.dart';
import 'package:ruthapp/cliente/cliente.dart';

class InfoCliente extends StatelessWidget {

  final Cliente _clienteSeleccionado;

  InfoCliente(@required this._clienteSeleccionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _crearImagenCliente(),
          _crearInfo()          
        ],
      ),
    );
  }

  Hero _crearImagenCliente() {
    return Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 30.0),
        child: Image(height: 160, image: NetworkImage(this._clienteSeleccionado.imagen))
      ),
    );
  }

  Container _crearInfo(){
    return Container(
      child: Column(
        children: <Widget>[
          _crearNombre(),
          _crearCorreo()          
        ],
      )
    );
  }

  Container _crearNombre(){
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(
        this._clienteSeleccionado.nombre,
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Container _crearCorreo(){
    return Container(
      child: Column(
        children: <Widget>[
          Text(this._clienteSeleccionado.correo),
          Text('Estado : ${this._clienteSeleccionado.estado}')
        ],
      )
    );
  }

}
