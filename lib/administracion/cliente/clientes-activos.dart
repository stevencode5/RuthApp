import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ruthapp/administracion/tienda/servicio-tienda.dart';
import 'package:ruthapp/cliente/cliente.dart';

class ClientesActivos extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ClientesActivosState();
  }
}

class _ClientesActivosState extends State<ClientesActivos> {

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
    print('Creando lista clientes');
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('tiendas')
        .document('-LYDnJ22RH-ISqVqfKir').collection('clientes')
        .where('estado', isEqualTo: 'Activo')
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
                return _crearListTile(Cliente.fromSnapshot(document), context);
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

  ListTile _crearListTile(Cliente cliente, BuildContext context) {
    return ListTile(
      title: Text(cliente.nombre),
      leading: Image(width: 70, image: AssetImage(cliente.imagen)),
      subtitle: Text(cliente.correo),        
    );
  }

}
