import 'package:cloud_firestore/cloud_firestore.dart';

class Tienda {
  String id;
  String nombre;
  String tendero;
  String descripcion;
  String imagen;   

  Tienda();

  Tienda.fromId(String id){
    this.id = id;
  }

  Tienda.fromDatos(String id, String nombre, String tendero, String descripcion, String imagen) {
    this.id = id;
    this.nombre = nombre;
    this.tendero = tendero;
    this.descripcion = descripcion;
    this.imagen = imagen;
  }

  Tienda.fromSnapshot(DocumentSnapshot snapshot)
      : this.id = snapshot.documentID,
        this.nombre = snapshot['nombre'],
        this.tendero = snapshot['tendero'],
        this.descripcion = snapshot['descripcion'],
        this.imagen = snapshot['imagen'];

}
