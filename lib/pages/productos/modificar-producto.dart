import 'package:flutter/material.dart';
import 'package:ruthapp/pages/productos/producto.dart';
import 'package:ruthapp/pages/productos/servicioProductos.dart';

class ModificarProducto extends StatefulWidget {
  final Producto producto;

  ModificarProducto(@required this.producto);

  @override
  State<StatefulWidget> createState() {
    return _ModificarProductoState();
  }
}

class _ModificarProductoState extends State<ModificarProducto> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  ServicioProducto servicioProducto;

  Producto _productoModificar;

  _ModificarProductoState() {
    servicioProducto = new ServicioProducto();
    _productoModificar = new Producto();
  }

  @override
  Widget build(BuildContext context) {
    this._productoModificar = widget.producto;
    return Scaffold(
        appBar: AppBar(
          title: Text('Modificar - ${_productoModificar.nombre}'),
        ),
        body: _crearFormulario(context));
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
          _crearTextFieldImagen(),
          _crearBotonGuardar(context)
        ],
      ),
    );
  }

  TextFormField _crearTextFieldNombre() {
    return TextFormField(
      initialValue: this._productoModificar.nombre,
      onSaved: (String nombre) {
        this._productoModificar.nombre = nombre;
      },
      enabled: false,
      decoration: InputDecoration(
        icon: Icon(Icons.local_grocery_store),
        hintText: 'Ingrese el nombre del producto',
        labelText: 'Nombre',
      ),
    );
  }

  TextFormField _crearTextFieldPrecio() {
    return TextFormField(
      initialValue: this._productoModificar.precio.toString(),
      onSaved: (String precio) {
        this._productoModificar.precio = int.parse(precio);
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
      initialValue: this._productoModificar.cantidad.toString(),
      onSaved: (String cantidad) {
        this._productoModificar.cantidad = int.parse(cantidad);
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
      initialValue: this._productoModificar.imagen,
      onSaved: (String imagen) {
        this._productoModificar.imagen = imagen;
      },
      decoration: InputDecoration(
        icon: Icon(Icons.image),
        hintText: 'Ingrese una imagen del producto',
        labelText: 'Imagen',
      ),
    );
  }

  Container _crearBotonGuardar(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 40.0, top: 20.0),
        child: RaisedButton(
          color: Colors.blue,
          child: Text('Guardar', style: TextStyle(color: Colors.white)),
          onPressed: () => _mostrarConfirmacion(context)
        ));
  }

  void _modificarProducto(BuildContext context) {
    print('Entro a modificar Producto !');
    _formKey.currentState.save();
    this.servicioProducto.modificarProducto(this._productoModificar);
    Navigator.pop(context, true); // TODO implementar cuando respuesta no sea exitosa
  }

  void _mostrarConfirmacion(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('Confirmacion'),
          content: new Text('¿Esta seguro de modificar el producto?'),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              }
            ),
            new FlatButton(
              child: new Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
                _modificarProducto(context);
              },
            )            
          ],
        );
      },
    );
  }
}
