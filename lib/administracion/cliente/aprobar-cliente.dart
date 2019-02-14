import 'package:flutter/material.dart';
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
              _crearImagenCliente(),
              _crearInfo(),
              _crearBotonAceptar()
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

  Container _crearBotonAceptar() {
    return Container(
        padding: EdgeInsets.only(top: 35),
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
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
    servicioTienda.cambiarEstadoCliente(this._clienteSeleccionado, 'Activo', Tienda()); // Todo ponder tienda 
    Navigator.of(context).pop();
  }

}
