import 'package:cloud_firestore/cloud_firestore.dart';

class Producto {
  String id;
  String nombre;
  int cantidad;
  int precio;
  String imagen;

  Producto();

  Producto.fromDatos(String id, String nombre, int cantidad, int precio, String imagen) {
    this.id = id;
    this.nombre = nombre;
    this.cantidad = cantidad;
    this.precio = precio;
    this.imagen = imagen;
  }

  Producto.fromSnapshot(DocumentSnapshot snapshot)
      : this.id = snapshot.documentID,
        this.nombre = snapshot['nombre'],
        this.cantidad = snapshot['cantidad'],
        this.precio = snapshot['precio'],
        this.imagen = snapshot['imagen'];
}
