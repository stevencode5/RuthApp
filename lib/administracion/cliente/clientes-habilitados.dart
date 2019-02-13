import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ruthapp/administracion/productos/producto.dart';
import 'package:ruthapp/administracion/tienda/servicio-tienda.dart';

class ClientesHabilitados extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ClientesHabilitadosState();
  }
}

class _ClientesHabilitadosState extends State<ClientesHabilitados> {

  ServicioTienda servicioTienda = new ServicioTienda();

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: Stack(children: <Widget>[
        _crearListaClientes(context)
      ]),
    );
  }

  Widget _crearListaClientes(BuildContext context) {
    print('Creando lista producto');
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('tiendas')
        .document('-LYDnJ22RH-ISqVqfKir').collection('clientes')
        .where('estado', isEqualTo: 'Pendiente')
        .snapshots(),
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
        leading: Image(width: 70, image: AssetImage(producto.imagen)),
        title: Text(producto.nombre)
        );
  }

}
