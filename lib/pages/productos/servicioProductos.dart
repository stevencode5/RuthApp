import 'package:cloud_firestore/cloud_firestore.dart';

import 'producto.dart';

class ServicioProducto {
  void crearProducto(Producto producto) {
    print("Producto a crear !");
    imprimirProducto(producto);
    Firestore.instance.collection('productos').document().setData({
      'id': DateTime.now().toString(),
      'nombre': producto.nombre,
      'cantidad': producto.cantidad,
      'precio': producto.precio,
      'imagen': producto.imagen,
    });
  }

  void modificarProducto(Producto producto) {
    print("Producto a crear !");
    imprimirProducto(producto);
  }

  void imprimirProducto(Producto producto) {
    print("Nombre ${producto.nombre}");
    print("Precio ${producto.precio}");
    print("Cantidad ${producto.cantidad}");
    print("Imagen ${producto.imagen}");
  }
}
