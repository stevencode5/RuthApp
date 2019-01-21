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

  Producto _nuevoProducto;

  _ModificarProductoState() {
    servicioProducto = new ServicioProducto();
    _nuevoProducto = new Producto();
  }

  @override
  Widget build(BuildContext context) {  
    this._nuevoProducto = widget.producto;  
    return Scaffold(
        appBar: AppBar(
          title: Text("Modificar - ${_nuevoProducto.nombre}"),
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

  Container _crearBotonGuardar(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 40.0, top: 20.0),
        child: RaisedButton(
          color: Colors.blue,
          child: Text("Guardar", style: TextStyle(color: Colors.white)),
          onPressed: () => _crearProducto(context),
        ));
  }

  void _crearProducto(BuildContext context) {
    print("Entro a crear Producto !");
    _formKey.currentState.save();
    this.servicioProducto.crearProducto(this._nuevoProducto);
    Navigator.pop(context, true); // TODO implementar cuando respuesta no sea exitosa
  }

}
