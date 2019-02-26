import 'package:flutter/material.dart';
import 'package:ruthapp/administracion/cliente/info-cliente.dart';
import 'package:ruthapp/administracion/tienda/servicio-tienda.dart';
import 'package:ruthapp/administracion/tienda/tienda.dart';
import 'package:ruthapp/cliente/cliente.dart';

class AprobarCliente extends StatefulWidget {

  final Cliente cliente;

  AprobarCliente(@required this.cliente);

  @override
  State<StatefulWidget> createState() {
    return _AprobarClienteState();
  }
}

class _AprobarClienteState extends State<AprobarCliente> {

  ServicioTienda servicioTienda = new ServicioTienda();

  Cliente _clienteSeleccionado;

  @override
  Widget build(BuildContext context) {
    this._clienteSeleccionado = widget.cliente;
    return Scaffold(
        appBar: AppBar(
          title: Text('Aprobar Cliente'),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
              InfoCliente(this._clienteSeleccionado),
              Divider(),
              _crearBotonAprobar()
            ],
            )
        )
    );
  }     


  Container _crearBotonAprobar() {
    return Container(
        child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          color: Colors.blue,
          child: Text('Aprobar !',
              style: TextStyle(fontSize: 20.0, color: Colors.white)),
          onPressed:(){
            _mostrarConfirmacion();
          } 
        ));
  }

  void _mostrarConfirmacion() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmacion'),
          content: Text('¿Esta seguro de suscribir este cliente?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              }
            ),
            FlatButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
                _suscribirCliente(_suscribirCliente);
                _mostrarInfoSuscripcion();
              },
            )            
          ],
        );
      },
    );
  }

  void _mostrarInfoSuscripcion() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Suscripcion existosa'),
          content: Text('Tienes un nuevo cliente en tu tienda.'),          
          actions: <Widget>[
            FlatButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )            
          ]
        );
      },
    );
  }

  void _suscribirCliente(c){
    print('Suscribiendo cliente');
    servicioTienda.cambiarEstadoCliente(this._clienteSeleccionado, 'Activo', Tienda.fromId('-LYDnJ22RH-ISqVqfKir')); // Todo ponder tienda 
    Navigator.of(context).pop();
  }

}
