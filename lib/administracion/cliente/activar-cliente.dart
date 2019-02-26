import 'package:flutter/material.dart';
import 'package:ruthapp/administracion/cliente/cuenta-cliente.dart';
import 'package:ruthapp/administracion/cliente/info-cliente.dart';
import 'package:ruthapp/administracion/tienda/servicio-tienda.dart';
import 'package:ruthapp/administracion/tienda/tienda.dart';
import 'package:ruthapp/cliente/cliente.dart';

class ActivarClente extends StatefulWidget {

  final Cliente cliente;

  ActivarClente(@required this.cliente);

  @override
  State<StatefulWidget> createState() {
    return _ActivarClenteState();
  }
}

class _ActivarClenteState extends State<ActivarClente> {

  ServicioTienda servicioTienda = new ServicioTienda();

  Cliente _clienteSeleccionado;

  @override
  Widget build(BuildContext context) {
    this._clienteSeleccionado = widget.cliente;
    return Scaffold(
        appBar: AppBar(
          title: Text('Información Cliente'),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
              InfoCliente(this._clienteSeleccionado),
              Divider(),
              _crearBotonActivar()
            ],
            )
        )
    );
  }     


  Container _crearBotonCuenta() {
    return Container(
        padding: EdgeInsets.only(top: 35),
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          color: Colors.blue,
          child: Text('Cuenta !',
              style: TextStyle(fontSize: 20.0, color: Colors.white)),
          onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CuentaCliente(this._clienteSeleccionado, Tienda()))); 
          } 
        ));
  }

  Container _crearBotonActivar() {
    return Container(
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          color: Colors.blue,
          child: Text('Activar !',
              style: TextStyle(fontSize: 20.0, color: Colors.white)),
          onPressed:(){
            _mostrarConfirmacionEliminar();
          } 
        ));
  }

  void _mostrarConfirmacionEliminar() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmacion'),
          content: Text('¿Esta seguro de activar este cliente?'),
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
                _eliminarCliente();
                _mostrarMensajeExitoso();
              },
            )            
          ],
        );
      },
    );
  }

  void _mostrarMensajeExitoso() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Activacion exitosa'),
          content: Text('El cliente ha sido activado.'),          
          actions: <Widget>[
            FlatButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            )            
          ],
        );
      },
    );
  }

  void _eliminarCliente(){
    print('Eliminando cliente');
    servicioTienda.cambiarEstadoCliente(this._clienteSeleccionado, 'Activo', Tienda.fromId('-LYDnJ22RH-ISqVqfKir')); // Todo ponder tienda     
  }


}
