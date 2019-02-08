import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ruthapp/administracion/productos/crear-producto.dart';
import 'package:ruthapp/administracion/productos/modificar-producto.dart';
import 'package:ruthapp/administracion/productos/producto.dart';
import 'package:ruthapp/administracion/productos/servicio-productos.dart';

class ConsultaProductos extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ConsultaProductosState();
  }
}

class _ConsultaProductosState extends State<ConsultaProductos> {

  ServicioProducto servicioProducto = new ServicioProducto();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: Stack(children: <Widget>[
        _crearListaProductos(context),
        _crearBotonCrearProducto(context)
      ]),
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

  Container _crearBotonCrearProducto(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        alignment: Alignment.bottomRight,
        child: Builder(builder: (BuildContext context) {
          return FloatingActionButton(
            tooltip: 'Nuevo Producto',
            onPressed: () {
              _llamarAPantallaCrearProducto(context);
            },
            child: Icon(Icons.add),
          );
        }));
  }

  ListTile _crearListTile(Producto producto, BuildContext context) {
    return ListTile(
        subtitle: Text(
          'Cantidad: ${producto.cantidad.toString()} \n\$${producto.precio}',
          style: TextStyle(fontSize: 13)),
        trailing: IconButton(
          icon: Icon(Icons.edit),
          onPressed: (){
            _llamarAPantallaModificarProducto(producto, context);
          }
        ),
        leading: Image(width: 70, image: AssetImage(producto.imagen)),
        title: Text(producto.nombre),
        onLongPress: () {
          _mostrarConfirmacionEliminacion(producto, context);
        });
  }

  void _llamarAPantallaModificarProducto(
      Producto producto, BuildContext context) async {
    print('Entra a modificar ${producto.nombre}');

    final bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) => ModificarProducto(producto)));
    if (result) {
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('Modificacion Exitosa')));
    }
  }

  void _llamarAPantallaCrearProducto(BuildContext context) async {
    final bool result = await Navigator.pushNamed(context, '/administracion/productos/crear-producto');
    if (result) {
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('Nuevo producto agregado')));
    }
  }

  void _mostrarConfirmacionEliminacion(Producto producto, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmacion'),
          content: Text('¿Desea eliminar el producto ${producto.nombre}?'),
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
                servicioProducto.eliminarProducto(producto);
              },
            )            
          ],
        );
      },
    );
  }


}
