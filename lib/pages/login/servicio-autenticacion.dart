import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ServicioAutenticacion {

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FacebookLogin _facebookLogin = FacebookLogin();

  Future<FirebaseUser> getUsuarioActual() {
    print('Entro a consultar usuario actual');
    return _firebaseAuth.currentUser();
  }

  Future<FirebaseUser> ingresar(String email, String password) {
    print('Ingresar con FireAuth con $email y $password');
    return _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<FirebaseUser> crearCuenta(String email, String password) {
    print('Crear cuenta con $email y $password');
    return _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<FirebaseUser> ingresarConGoogle() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await _firebaseAuth.signInWithCredential(credential);
  }

  Future<FirebaseUser> ingresarConFacebook() async {
    FacebookLoginResult facebookUser = await _facebookLogin.logInWithReadPermissions(['email', 'public_profile']);   
    switch (facebookUser.status) {
      case FacebookLoginStatus.loggedIn:
        AuthCredential credential = FacebookAuthProvider.getCredential(
            accessToken: facebookUser.accessToken.token
        );
        return await _firebaseAuth.signInWithCredential(credential);
      case FacebookLoginStatus.cancelledByUser:
        print('Cancelado por el usuario');        
        break;
      case FacebookLoginStatus.error:
        print(facebookUser.errorMessage);
        break;
    } 
    return Future.error('No se pudo ingresar');
  }

  Future<void> cerrarSesion() {
    print('Cerrar sesion');
    return _firebaseAuth.signOut();
  }

}
