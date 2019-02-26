import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Cliente {
  String id;
  String nombre;
  String correo;
  String imagen;
  String estado;

  Cliente();

  Cliente.fromDatos(String id, String nombre, String correo, String imagen, String estado) {
    this.id = id;
    this.nombre = nombre;
    this.correo = correo;
    this.imagen = imagen;
    this.estado = estado;
  }

  Cliente.fromSnapshot(DocumentSnapshot snapshot)
      : this.id = snapshot.documentID,
        this.nombre = snapshot['nombre'],
        this.correo = snapshot['correo'],
        this.imagen = snapshot['imagen'],
        this.estado = snapshot['estado'];

  Cliente.fromUsuario(FirebaseUser usuario)
      : this.id = usuario.email,
        this.nombre = usuario.displayName,
        this.correo = usuario.email,
        this.imagen = usuario.photoUrl;        

}
