import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ruthapp/pages/productos/producto.dart';
import 'package:ruthapp/pages/productos/servicio-productos.dart';

class ProductosDisponibles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductosDisponiblesState();
  }
}

class _ProductosDisponiblesState extends State<ProductosDisponibles> {
  ServicioProducto servicioProducto = new ServicioProducto();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _crearListaProductos(context),
      ],
    );
  }

  Widget _crearListaProductos(BuildContext context) {
    print('Creando lista producto');
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('productos').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return _crearTextoCargando();
          default:
            return ListView(
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                return _crearListTile(Producto.fromSnapshot(document), context);
              }).toList(),
            );
        }
      },
    );
  }

  Container _crearTextoCargando() {
    return Container(
        child: Center(
      child: Text(
        'Cargando ...',
        style: TextStyle(fontSize: 20),
      ),
    ));
  }

  ListTile _crearListTile(Producto producto, BuildContext context) {
    return ListTile(
        subtitle: Text(
            'Cantidad: ${producto.cantidad.toString()} \n\$${producto.precio}',
            style: TextStyle(fontSize: 13)),
        trailing: _crearBotonesProducto(producto, context),
        leading: Image(width: 70, image: new AssetImage(producto.imagen)),
        title: Text(producto.nombre));
  }

  Widget _crearBotonesProducto(Producto producto, BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.remove_circle),
            padding: EdgeInsets.all(0),
            onPressed: () {
              _restarProducto(producto, context);
            }),
        IconButton(
            icon: Icon(Icons.add_circle),
            padding: EdgeInsets.all(0),
            onPressed: () {
              _sumarProducto(producto, context);
            })
      ],
    );
  }

  void _restarProducto(Producto producto, BuildContext context) {
    print('Restar ---- producto ${producto.nombre}');
  }

  void _sumarProducto(Producto producto, BuildContext context) {
    print('Sumar ++++ producto ${producto.nombre}');
  }
}
