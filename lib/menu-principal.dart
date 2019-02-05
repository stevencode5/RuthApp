import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ruthapp/pages/login/servicio-autenticacion.dart';

class MenuPrincipal extends StatelessWidget {
  ServicioAutenticacion servicioAutenticacion = new ServicioAutenticacion();

  FirebaseUser _usuario;

  MenuPrincipal() {
    servicioAutenticacion
        .consultarUsuarioActual()
        .then((usuario) => this._usuario = usuario);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        _crearInformacionUsuario(),
        _crearLink(context),
        _crearLink(context),
        Divider(),
        _crearBotonCerrarSesion(context)
      ],
    ));
  }

  UserAccountsDrawerHeader _crearInformacionUsuario() {
    return UserAccountsDrawerHeader(
      accountName: Text(_usuario.displayName),
      accountEmail: Text(_usuario.email),
      currentAccountPicture: CircleAvatar(
        radius: 30.0,
        backgroundImage: NetworkImage(_usuario.photoUrl),
        backgroundColor: Colors.transparent,
      ),
    );
  }

  ListTile _crearLink(BuildContext context) {
    return ListTile(
      title: Text('Item 1'),
      trailing: Icon(Icons.android),
      onTap: () {
        Navigator.pop(context);
        // Navigator.push(context,  MaterialPageRoute(builder: (context) =>  FirstPage()));
      },
    );
  }

  ListTile _crearBotonCerrarSesion(BuildContext context) {
    return ListTile(
        title: Text('Cerrar Sesion'),
        trailing: Icon(Icons.exit_to_app),
        onTap: () {
          _cerrarSesion(context);          
        });
  }

  void _cerrarSesion(BuildContext context) {
    servicioAutenticacion.cerrarSesion();
    Navigator.of(context).pushNamedAndRemoveUntil('/login/login', (Route<dynamic> route) => false);
  }
  
}
