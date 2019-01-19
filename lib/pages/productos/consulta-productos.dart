import 'package:flutter/material.dart';
import 'package:ruthapp/pages/productos/crear-producto.dart';
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
        _crearListaProductos(),
        _crearBotonCrearProducto(context)
      ]),
    );
  }

  ListView _crearListaProductos() {
    return ListView(children: _crearProductos());
  }

  Container _crearBotonCrearProducto(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        alignment: Alignment.bottomRight,
        child: Builder(builder: (BuildContext context) {
          return FloatingActionButton(
            tooltip: "Nuevo Producto",
            onPressed: () {
              llamarAPantallaCrearProducto(context);
            },
            child: Icon(Icons.add),
          );
        }));
  }

  List<Widget> _crearProductos() {
    List<Widget> lista = new List<Widget>();
    this._productos.forEach((producto) => lista.add(_crearListTile(producto)));
    return lista;
  }

  ListTile _crearListTile(Producto producto) {
    return ListTile(
      subtitle: Text("Cantidad: " + producto.cantidad.toString()),
      trailing: Text(producto.precio.toString()),
      leading: Image(width: 70, image: new AssetImage(producto.imagen)),
      title: Text(producto.nombre),
    );
  }

  void llamarAPantallaCrearProducto(BuildContext context) async {
    final bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => CrearProducto()));
    if (result) {
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text("Nuevo producto agregado")));
    }
  }

}
