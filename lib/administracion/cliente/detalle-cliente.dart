import 'package:flutter/material.dart';
import 'package:ruthapp/administracion/cliente/cuenta-cliente.dart';
import 'package:ruthapp/administracion/cliente/info-cliente.dart';
import 'package:ruthapp/administracion/tienda/servicio-tienda.dart';
import 'package:ruthapp/administracion/tienda/tienda.dart';
import 'package:ruthapp/cliente/cliente.dart';

class DetalleCliente extends StatefulWidget {

  final Cliente cliente;

  DetalleCliente(@required this.cliente);

  @override
  State<StatefulWidget> createState() {
    return _DetalleClienteState();
  }
}

class _DetalleClienteState extends State<DetalleCliente> {

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
              _crearBotonCuenta(),
              Divider(),
              _crearBotonEliminar()
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

  Container _crearBotonEliminar() {
    return Container(
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          color: Colors.blue,
          child: Text('Eliminar !',
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
          content: Text('¿Esta seguro de eliminar este cliente?'),
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
          title: Text('Eliminacion exitosa'),
          content: Text('El cliente ha sido eliminado.'),          
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
    servicioTienda.cambiarEstadoCliente(this._clienteSeleccionado, 'Inactivo', Tienda.fromId('-LYDnJ22RH-ISqVqfKir')); // Todo ponder tienda     
  }


}
