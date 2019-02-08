import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ruthapp/autenticacion/servicio-autenticacion.dart';

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
        _crearPanelInformacionUsuario(),
        _crearDivisionTitulo('Administración'),
        _crearLinkProductos(context),
        _crearDivisionTitulo('Cliente'),
        _crearLinkComprarProductos(context),
        Divider(),
        _crearLinkAdministracionUsuario(context),
        _crearBotonCerrarSesion(context)
      ],
    ));
  }

  UserAccountsDrawerHeader _crearPanelInformacionUsuario() {
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

  ListTile _crearDivisionTitulo(String titulo) {
    return ListTile(    
      enabled: false,
      title: Text(titulo)
    );
  }

  ListTile _crearLinkProductos(BuildContext context) {
    return ListTile(
      title: Text('Productos'),
      leading: Icon(Icons.store),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, '/administracion/productos/consulta-producto');
      },
    );
  }

  ListTile _crearLinkComprarProductos(BuildContext context) {
    return ListTile(
      title: Text('Comprar'),
      leading: Icon(Icons.add_shopping_cart),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, '/cliente/comprar-producto');
      },
    );
  }

  ListTile _crearLinkAdministracionUsuario(BuildContext context) {
    return ListTile(
      title: Text('Editar Perfil'),
      trailing: Icon(Icons.edit),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, '/general/administracion-usuario');
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
    Navigator.of(context).pushNamedAndRemoveUntil('/autenticacion/login', (Route<dynamic> route) => false);
  }
  
}
