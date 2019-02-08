import 'package:flutter/material.dart';
import 'package:ruthapp/general/menu-principal.dart';

class AdministracionTienda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Administracion Tienda'),
      ),
      drawer: MenuPrincipal(),
      body: Container(
        child: Center(
          child: Text('Esto es un texto !'),
          )
      ),
    );
  }
}
