import 'package:cloud_firestore/cloud_firestore.dart';

import 'producto.dart';

class ServicioProducto {

  Future<QuerySnapshot> consultarProductos() async {
    return await Firestore.instance.collection('productos').getDocuments();
  }

  void crearProducto(Producto producto) {
    print('Producto a crear !');
    imprimirProducto(producto);
    Firestore.instance.collection('productos').document().setData({
      'nombre': producto.nombre,
      'cantidad': producto.cantidad,
      'precio': producto.precio,
      'imagen': producto.imagen,
    }).catchError((e) {
      print(e);
    });
  }

  void modificarProducto(Producto producto) {
    print('Producto a modificar !');
    imprimirProducto(producto);
    Firestore.instance
        .collection('productos')
        .document(producto.id)
        .updateData({
          'cantidad': producto.cantidad,
          'precio': producto.precio,
          'imagen': producto.imagen,
        }).catchError((e) {
          print(e);
        });
  }

  void eliminarProducto(Producto producto){
    print('Producto a eliminar !');
    imprimirProducto(producto);
    Firestore.instance
        .collection('productos')
        .document(producto.id)
        .delete()
        .catchError((e) {
          print(e);
        });
  }

  void imprimirProducto(Producto producto) {
    print('Nombre ${producto.nombre}');
    print('Precio ${producto.precio}');
    print('Cantidad ${producto.cantidad}');
    print('Imagen ${producto.imagen}');
  }
}
