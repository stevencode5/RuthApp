import 'package:flutter/material.dart';
import 'package:ruthapp/administracion/cliente/cuenta-cliente.dart';
import 'package:ruthapp/administracion/tienda/servicio-tienda.dart';
import 'package:ruthapp/administracion/tienda/tienda.dart';
import 'package:ruthapp/cliente/cliente.dart';

class InfoCliente extends StatefulWidget {

  final Cliente cliente;

  InfoCliente(@required this.cliente);

  @override
  State<StatefulWidget> createState() {
    return _InfoClienteState();
  }
}

class _InfoClienteState extends State<InfoCliente> {

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
              _crearImagenCliente(),
              _crearInfo(),
              _crearBotonCuenta(),
              _crearBotonEliminar()
            ],
            )
        )
    );
  }     

  Hero _crearImagenCliente() {
    return Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 30.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 70.0,
          child: Image.asset(this._clienteSeleccionado.imagen),
        ),
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
        padding: EdgeInsets.only(top: 35),
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
    servicioTienda.cambiarEstadoCliente(this._clienteSeleccionado, 'Activo', Tienda()); // Todo ponder tienda     
  }


}
