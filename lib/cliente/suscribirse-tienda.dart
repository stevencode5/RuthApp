import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ruthapp/administracion/tienda/servicio-tienda.dart';
import 'package:ruthapp/administracion/tienda/tienda.dart';
import 'package:ruthapp/cliente/info-tienda.dart';

class SuscribirseTienda extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SuscribirseTiendaState();
  }
}

class _SuscribirseTiendaState extends State<SuscribirseTienda> {

  ServicioTienda servicioTienda = new ServicioTienda();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tiendas Disponibles'),
      ),
      body: _crearListaTiendas(context)
    );
  }

  Widget _crearListaTiendas(BuildContext context) {
    print('Creando lista de tiendas');
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('tiendas').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return _crearTextoCargando();
          default:
            return ListView(
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                return _crearListTile(Tienda.fromSnapshot(document), context);
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


  ListTile _crearListTile(Tienda tienda, BuildContext context) {
    return ListTile(
      title: Text(tienda.nombre),
      subtitle: Text(tienda.descripcion),
      trailing: Icon(Icons.arrow_forward_ios),
      leading: Image(width: 70, image: AssetImage(tienda.imagen)),        
      onTap: () {
        _mostrarInforTienda(tienda, context);
      });
  }

  void _mostrarInforTienda(Tienda tienda, BuildContext context) async {
      final bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) => InfoTienda(tienda)));
      print('Se suscribio a la tienda $result');
  }


}
