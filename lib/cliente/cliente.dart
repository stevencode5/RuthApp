import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ruthapp/cliente/estado-cliente.dart';

class Cliente {
  String id;
  String nombre;
  EstadoCliente estado;

  Cliente();

  Cliente.fromDatos(String id, String nombre, EstadoCliente estado) {
    this.id = id;
    this.nombre = nombre;
    this.estado = estado;
  }

  Cliente.fromSnapshot(DocumentSnapshot snapshot)
      : this.id = snapshot.documentID,
        this.nombre = snapshot['nombre'],
        this.estado = snapshot['estado'];
}
