import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ruthapp/administracion/cliente/activar-cliente.dart';
import 'package:ruthapp/administracion/cliente/aprobar-cliente.dart';
import 'package:ruthapp/administracion/cliente/detalle-cliente.dart';
import 'package:ruthapp/administracion/tienda/servicio-tienda.dart';
import 'package:ruthapp/cliente/cliente.dart';

class ConsultarClientes extends StatefulWidget {

  final String estado;

  ConsultarClientes(@required this.estado);

  @override
  State<StatefulWidget> createState() {
    return _ConsultarClientesState();
  }
}

class _ConsultarClientesState extends State<ConsultarClientes> {

  ServicioTienda servicioTienda = new ServicioTienda();
  String _estado;

  @override
  Widget build(BuildContext context) {
    this._estado = widget.estado;
    print('Consultar clientes por estado : ${this._estado}');
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
        .document('-LYDnJ22RH-ISqVqfKir').collection('clientes') // TODO Cambio de id por el de la tienda registrada por el usuario
        .where('estado', isEqualTo: this._estado)
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
      leading: CircleAvatar(
        radius: 30.0,
        backgroundImage: NetworkImage(cliente.imagen),
        backgroundColor: Colors.transparent
      ),
      subtitle: Text(cliente.correo),   
      onTap: () {
        switch (this._estado) {
          case 'Pendiente':       
            Navigator.push(context, MaterialPageRoute(builder: (context) => AprobarCliente(cliente)));     
            break;
          case 'Activo':
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetalleCliente(cliente)));            
            break;
          case 'Inactivo':                        
            Navigator.push(context, MaterialPageRoute(builder: (context) => ActivarClente(cliente)));
            break;
        }              
      }     
    );
  }

}
