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
      body: Stack(
        children: <Widget>[
        _buildListaProductos(),
        _buildBotonCrearProducto(context)
      ]),
    );
  }

  Container _buildBotonCrearProducto(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
      tooltip: "Nuevo Producto",
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CrearProducto()));
      },
      child: Icon(Icons.add),
    ));
  }

  List<Widget> _crearProductos() {
    List<Widget> lista = new List<Widget>();
    this._productos.forEach((producto) => lista.add(_crearListTile(producto)));
    return lista;
  }

  ListTile _crearListTile(Producto producto) {
    return ListTile(
      leading: Icon(Icons.map),
      title: Text(producto.nombre),
    );
  }

  ListView _buildListaProductos() {
    return ListView(children: _crearProductos());
  }
}
