import 'package:cloud_firestore/cloud_firestore.dart';

class Tienda {
  String id;
  String nombre;
  String tendero;
  String descripcion;
  String imagen;   
  Map clientes; 

  Tienda();

  Tienda.fromDatos(String id, String nombre, String tendero, String descripcion, String imagen, Map clientes) {
    this.id = id;
    this.nombre = nombre;
    this.tendero = tendero;
    this.descripcion = descripcion;
    this.imagen = imagen;
    this.clientes = clientes;
  }

  Tienda.fromSnapshot(DocumentSnapshot snapshot)
      : this.id = snapshot.documentID,
        this.nombre = snapshot['nombre'],
        this.tendero = snapshot['tendero'],
        this.descripcion = snapshot['descripcion'],
        this.imagen = snapshot['imagen'],
        this.clientes = snapshot['clientes'];
}
