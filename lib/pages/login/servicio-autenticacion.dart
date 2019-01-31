import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';


class ServicioAutenticacion {

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FacebookLogin _facebookLogin = FacebookLogin();

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

  void ingresarConFacebook() async {
    final facebookLogin = new FacebookLogin();
    final result = await facebookLogin.logInWithReadPermissions(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        print(result.accessToken.token);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('CANCELED BY USER');
        break;
      case FacebookLoginStatus.error:
        print(result.errorMessage);
        break;
    }
  }

}
