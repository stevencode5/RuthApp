import 'package:flutter/material.dart';
import 'package:ruthapp/pages/productos/crear-producto.dart';
import 'package:ruthapp/pages/productos/modificar-producto.dart';
import 'package:ruthapp/pages/productos/producto.dart';
import 'package:ruthapp/pages/productos/servicioProductos.dart';

class ConsultaProductos extends StatelessWidget {
  List<Producto> _productos;
  ServicioProducto servicioProducto;

  ConsultaProductos() {
    servicioProducto = new ServicioProducto();
    _productos = servicioProducto.consultarTodosProductos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Productos"),
      ),
      body: Stack(children: <Widget>[
        _crearListaProductos(context),
        _crearBotonCrearProducto(context)
      ]),
    );
  }

  ListView _crearListaProductos(BuildContext context) {
    return ListView(children: _crearProductos(context));
  }

  Container _crearBotonCrearProducto(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        alignment: Alignment.bottomRight,
        child: Builder(builder: (BuildContext context) {
          return FloatingActionButton(
            tooltip: "Nuevo Producto",
            onPressed: () {
              _llamarAPantallaCrearProducto(context);
            },
            child: Icon(Icons.add),
          );
        }));
  }

  List<Widget> _crearProductos(BuildContext context) {
    List<Widget> lista = new List<Widget>();
    this._productos.forEach((producto) => lista.add(_crearListTile(producto, context)));
    return lista;
  }

  ListTile _crearListTile(Producto producto, BuildContext context) {
    return ListTile(
      subtitle: Text("Cantidad: ${producto.cantidad.toString()}"),
      trailing: Text(producto.precio.toString()),
      leading: Image(width: 70, image: new AssetImage(producto.imagen)),
      title: Text(producto.nombre),
      onLongPress: () {
        _llamarAPantallaModificarProducto(producto, context);        
      }
    );
  }

  void _llamarAPantallaModificarProducto(Producto producto, BuildContext context) async {
    print("Entra a modificar ${producto.nombre}");

    final bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => ModificarProducto(producto)));
    if (result) {
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text("Modificacion Exitosa")));
    }
  }

  void _llamarAPantallaCrearProducto(BuildContext context) async {
    final bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => CrearProducto()));
    if (result) {
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text("Nuevo producto agregado")));
    }
  }

}
