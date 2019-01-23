import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:ruthapp/pages/productos/crear-producto.dart";
import "package:ruthapp/pages/productos/modificar-producto.dart";
import "package:ruthapp/pages/productos/producto.dart";

class ConsultaProductos extends StatelessWidget {

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

  Widget _crearListaProductos(BuildContext context) {
    print("Creando lista producto");
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("productos").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text("Error: ${snapshot.error}");
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text("Cargando...");
          default:
            return new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                return _crearListTile(Producto.fromSnapshot(document), context);
              }).toList(),
            );
        }
      },
    );
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
