import 'package:flutter/material.dart';
import 'package:ruthapp/administracion/tienda/tienda.dart';

class InfoTienda extends StatefulWidget {

  final Tienda tienda;

  InfoTienda(@required this.tienda);

  @override
  State<StatefulWidget> createState() {
    return _InfoTiendaState();
  }
}

class _InfoTiendaState extends State<InfoTienda> {

  Tienda _tiendaSeleccionada;

  @override
  Widget build(BuildContext context) {
    this._tiendaSeleccionada = widget.tienda;
    return Scaffold(
        appBar: AppBar(
          title: Text('Información Tienda'),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
              _crearLogo(),
              _crearInfo(),
              _crearBotonSuscribir()
            ],
          )         
        )
    );
  }

  Hero _crearLogo() {
    return Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 30.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 70.0,
          child: Image.asset(this._tiendaSeleccionada.imagen),
        ),
      ),
    );
  }

  Container _crearInfo(){
    return Container(
      child: Column(
        children: <Widget>[
          _crearTitulo(),
          _crearDescripcion()          
        ],
      )
    );
  }

  Container _crearTitulo(){
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(
        this._tiendaSeleccionada.nombre,
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Container _crearDescripcion(){
    return Container(
      child: Text(
        this._tiendaSeleccionada.descripcion,
        style: TextStyle(
          fontSize: 15.0
        ),
      ),
    );
  }

  Container _crearBotonSuscribir() {
    return Container(
        padding: EdgeInsets.only(top: 35),
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          color: Colors.blue,
          child: Text('Suscribirse !',
              style: TextStyle(fontSize: 20.0, color: Colors.white)),
          onPressed:(){
            _mostrarConfirmacion(context);
          } 
        ));
  }

  void _mostrarConfirmacion(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmacion'),
          content: Text('¿Esta seguro de suscribirse a esta tienda?'),
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
                _mostrarInfoSuscripcion(context);
              },
            )            
          ],
        );
      },
    );
  }

  void _mostrarInfoSuscripcion(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Suscripcion existosa'),
          content: Text('Suscripcion pendiente de aprobacion por el tendero.'),          
          actions: <Widget>[
            FlatButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
                _suscribirUsuario(context);
              },
            )            
          ],
        );
      },
    );
  }

  void _suscribirUsuario(BuildContext context){
    print('Suscribiendo usuario');
    Navigator.of(context).pop();
  }

}
