import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ruthapp/autenticacion/usuario.dart';

class ServicioAutenticacion {

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FacebookLogin _facebookLogin = FacebookLogin();

  Future<FirebaseUser> consultarUsuarioActual() async {
    print('Consultando usuario actual');
    FirebaseUser usuario = await _firebaseAuth.currentUser();
    print('Usuario actual nombre: ${usuario.displayName} correo: ${usuario.email} imagen : ${usuario.photoUrl}');
    return usuario;
  }

  Future<FirebaseUser> ingresar(String correo, String password) {
    print('Ingresar con FireAuth con $correo y $password');
    return _firebaseAuth.signInWithEmailAndPassword(
        email: correo, password: password);
  }

  Future<void> crearCuenta(Usuario usuario) async {    
    print('Crear cuenta con nombre: ${usuario.nombre} correo: ${usuario.correo} contraseña: ${usuario.password} e imagen ${usuario.imagen}');
    FirebaseUser usuarioRegistrado = await _firebaseAuth.createUserWithEmailAndPassword(email: usuario.correo, password: usuario.password);
    actualizarInformacionUsuario(usuarioRegistrado, usuario);    
  }

  void actualizarInformacionUsuario(FirebaseUser usuarioRegistrado, Usuario usuario){
    UserUpdateInfo info = armarInformacionUsuario(usuario);
    usuarioRegistrado.updateProfile(info);
  }

  UserUpdateInfo armarInformacionUsuario(Usuario usuario){
    UserUpdateInfo informacionUsuario = new UserUpdateInfo();
    informacionUsuario.displayName = usuario.nombre;
    informacionUsuario.photoUrl = usuario.imagen;    
    return informacionUsuario;
  }

  Future<FirebaseUser> ingresarConGoogle() async {
    print("Ingresar con Google");
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await _firebaseAuth.signInWithCredential(credential);
  }

  Future<FirebaseUser> ingresarConFacebook() async {
    print("Ingresar con facebook");
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

  void cerrarSesion() async {
    print('Cerrar sesion');
    await _firebaseAuth.signOut();
  }

}
