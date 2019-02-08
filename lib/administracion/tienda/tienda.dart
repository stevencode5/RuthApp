import 'package:cloud_firestore/cloud_firestore.dart';

class Tienda {
  String id;
  String nombre;
  String tendero;
  String imagen;   

  Tienda();

  Tienda.fromDatos(String id, String nombre, String tendero, String imagen) {
    this.id = id;
    this.nombre = nombre;
    this.tendero = tendero;
    this.imagen = imagen;
  }

  Tienda.fromSnapshot(DocumentSnapshot snapshot)
      : this.id = snapshot.documentID,
        this.nombre = snapshot['nombre'],
        this.tendero = snapshot['tendero'],
        this.imagen = snapshot['imagen'];
}
