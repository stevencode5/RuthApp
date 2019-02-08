import 'package:flutter/material.dart';
import 'package:ruthapp/cliente/productos-disponibles.dart';
import 'package:ruthapp/cliente/productos-favoritos.dart';
import 'package:ruthapp/cliente/resumen-compra.dart';

class ComprarProducto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ComprarProductoState();
  }
}

class _ComprarProductoState extends State<ComprarProducto> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ProductosDisponibles(),
    ProductosFavoritos(),
    ResumenCompra()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comprar productos'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            title: Text('Productos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favoritos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            title: Text('Cuenta')
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
