import 'package:flutter/material.dart';
import 'package:ruthapp/pages/productos/crear-producto.dart';

class ConsultaProductos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Productos !"),
      ),
      body: Container(
          child: Center(
              child: Column(
                children: <Widget>[
                  Text("Productos !",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold)),

                  FloatingActionButton(
                    mini: true,
                    tooltip: "Nuevo Producto",
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CrearProducto()));
                    },
                    child: Icon(Icons.add),
                  )
        ]))),
    );
  }
}
