import 'package:flutter/material.dart';
import 'package:ruthapp/administracion/tienda/tienda.dart';
import 'package:ruthapp/cliente/cliente.dart';

class CuentaCliente extends StatefulWidget {

  final Cliente cliente;

  final Tienda tienda;
  
  CuentaCliente(@required this.cliente, @required this.tienda);

  @override
  State<StatefulWidget> createState() {
    return _CuentaClienteState();
  }
}

class _CuentaClienteState extends State<CuentaCliente> {

  Cliente _clienteSeleccionado;

  Tienda _tiendaSeleccionada;

  void espichar() {
    print('Oprimio el boton !!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cuenta cliente'),
        ),
        body: Container(
          child: Center(
            child: RaisedButton(
              padding: EdgeInsets.all(15.10),
              onPressed: espichar,
              child: Text('Oprima !'),
            ),
          )
        )
    );
  }
}
