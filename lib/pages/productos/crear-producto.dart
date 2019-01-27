import 'package:flutter/material.dart';
import 'package:ruthapp/pages/productos/producto.dart';
import 'package:ruthapp/pages/productos/servicioProductos.dart';

class CrearProducto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CrearProductoState();
  }
}

class _CrearProductoState extends State<CrearProducto> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  ServicioProducto servicioProducto;

  Producto _nuevoProducto;

  _CrearProductoState() {
    servicioProducto = new ServicioProducto();
    _nuevoProducto = new Producto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nuevo producto'),
        ),
        body: Stack(
          children: <Widget>[
            _crearFormulario(context),
            _crearBotonCrearProducto(context)
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
          _crearTextFieldPrecio(),
          _crearTextFieldCantidad(),
          _crearTextFieldImagen()
        ],
      ),
    );
  }

  TextFormField _crearTextFieldNombre() {
    return TextFormField(
      onSaved: (String nombre) {
        this._nuevoProducto.nombre = nombre;
      },
      decoration: InputDecoration(
        icon: Icon(Icons.local_grocery_store),
        hintText: 'Ingrese el nombre del producto',
        labelText: 'Nombre',
      ),
    );
  }

  TextFormField _crearTextFieldPrecio() {
    return TextFormField(
      onSaved: (String precio) {
        this._nuevoProducto.precio = int.parse(precio);
      },
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(
        icon: Icon(Icons.attach_money),
        hintText: 'Ingrese el precio del producto',
        labelText: 'Precio',
      ),
    );
  }

  TextFormField _crearTextFieldCantidad() {
    return TextFormField(
      onSaved: (String cantidad) {
        this._nuevoProducto.cantidad = int.parse(cantidad);
      },
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(
        icon: Icon(Icons.format_list_numbered),
        hintText: 'Ingrese la cantidad del producto',
        labelText: 'Cantidad',
      ),
    );
  }

  TextFormField _crearTextFieldImagen() {
    return TextFormField(
      onSaved: (String imagen) {
        this._nuevoProducto.imagen = imagen;
      },
      decoration: InputDecoration(
        icon: Icon(Icons.image),
        hintText: 'Ingrese una imagen del producto',
        labelText: 'Imagen',
      ),
    );
  }

  Container _crearBotonCrearProducto(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        alignment: Alignment.bottomRight,
        child: Builder(builder: (BuildContext context) {
          return FloatingActionButton(
            tooltip: 'Crear Producto',
            onPressed: () {
              _crearProducto(context);
            },
            child: Icon(Icons.save),
          );
        }));
  }

  void _crearProducto(BuildContext context) {
    print('Entro a crear Producto !');
    _formKey.currentState.save();
    this.servicioProducto.crearProducto(this._nuevoProducto);
    Navigator.pop(context, true); // TODO implementar cuando respuesta no sea exitosa
  }
}
