import 'package:flutter/material.dart';
import 'package:ruthapp/administracion/tienda/servicio-tienda.dart';
import 'package:ruthapp/administracion/tienda/tienda.dart';

class CrearTienda extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CrearTiendaState();
  }
}

class _CrearTiendaState extends State<CrearTienda> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  ServicioTienda servicioTienda = new ServicioTienda();

  Tienda _nuevaTienda = new Tienda();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nueva Tienda'),
        ),
        body: Stack(
          children: <Widget>[
            _crearFormulario(context),            
            _crearBotonCrearTienda(context)
          ],
        ));
  }

  Form _crearFormulario(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        children: <Widget>[
          _crearTextFieldNombre(),
          _crearTextFieldDescripcion(),
          _crearTextFieldImagen()
        ],
      ),
    );
  }

  TextFormField _crearTextFieldNombre() {
    return TextFormField(
      onSaved: (String nombre) {
        this._nuevaTienda.nombre = nombre;
      },
      decoration: InputDecoration(
        icon: Icon(Icons.local_grocery_store),
        hintText: 'Ingrese el nombre de la tienda',
        labelText: 'Nombre',
      ),
    );
  }

  TextFormField _crearTextFieldDescripcion() {
    return TextFormField(
      onSaved: (String descripcion) {
        this._nuevaTienda.descripcion = descripcion;
      },
      decoration: InputDecoration(
        icon: Icon(Icons.description),
        hintText: 'Ingrese una descripción',
        labelText: 'Descripción',
      ),
    );
  }

  TextFormField _crearTextFieldImagen() {
    return TextFormField(
      onSaved: (String imagen) {
        this._nuevaTienda.imagen = imagen;
      },
      decoration: InputDecoration(
        icon: Icon(Icons.image),
        hintText: 'Ingrese una imagen del producto',
        labelText: 'Imagen',
      ),
    );
  }

  Container _crearBotonCrearTienda(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        alignment: Alignment.bottomRight,
        child: Builder(builder: (BuildContext context) {
          return FloatingActionButton(
            tooltip: 'Crear Producto',
            onPressed: () {
              _crearTienda(context);
            },
            child: Icon(Icons.local_grocery_store),
          );
        }));
  }

  void _crearTienda(BuildContext context){
    print('Crear Tienda');    
    _formKey.currentState.save();
    this.servicioTienda.crearTienda(this._nuevaTienda);
    Navigator.of(context).pushNamedAndRemoveUntil('/administracion/administracion-tienda', (Route<dynamic> route) => false);   
  }

}
