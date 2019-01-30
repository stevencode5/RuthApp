import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ServicioAutenticacion {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUser> ingresar(String email, String password) {
    print('Ingresar con FireAuth con $email y $password');
    return _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<FirebaseUser> crearCuenta(String email, String password) {
    print('Crear cuenta con $email y $password');
    return _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<FirebaseUser> getUsuarioActual() {
    print('Entro a consultar usuario actual');
    return _firebaseAuth.currentUser();
  }

  Future<void> cerrarSesion() {
    print('Cerrar sesion');
    return _firebaseAuth.signOut();
  }

  Future<GoogleSignInAccount> ingresarConGoogle() {
    return _googleSignIn.signIn();
  }

  void cerrarSesionGoogle(){
    print('Cerrar sesion de google');
    _googleSignIn.signOut();
  }

}
