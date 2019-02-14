import 'package:flutter/material.dart';
import 'package:ruthapp/administracion/cliente/clientes-activos.dart';
import 'package:ruthapp/administracion/cliente/clientes-inactivos.dart';
import 'package:ruthapp/administracion/cliente/clientes-pendientes.dart';

class AdministrarClientes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AdministrarClientesState();
  }
}

class _AdministrarClientesState extends State<AdministrarClientes> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ClientesPendientes(),
    ClientesActivos(),
    ClientesInactivos()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Administrar Clientes'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            title: Text('Pendientes'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            title: Text('Activos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.close),
            title: Text('Inactivos')
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    }); 
  }
}
