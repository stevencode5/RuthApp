import 'package:ruthapp/pages/productos/producto.dart';

class ServicioProducto {
  List<Producto> consultarTodosProductos() {
    List<Producto> productos = new List<Producto>();
    productos = new List();
    productos.add(new Producto("1", "Papas", 34, 1200, "assets/imgs/dulce.png"));
    productos.add(new Producto("2", "Gansito", 56, 800, "assets/imgs/dulce.png"));
    productos.add(new Producto("3", "Quimbaya", 23, 400, "assets/imgs/dulce.png"));
    productos.add(new Producto("4", "Arepa", 56, 1500, "assets/imgs/dulce.png"));
    productos.add(new Producto("5", "Empanada", 57, 1500, "assets/imgs/dulce.png"));
    productos.add(new Producto("6", "Queso", 3, 1200, "assets/imgs/dulce.png"));
    productos.add(new Producto("7", "Chocorramo", 10, 1500, "assets/imgs/dulce.png"));
    
    productos.add(new Producto("8", "Chicarrones", 34, 1200, "assets/imgs/dulce.png"));
    productos.add(new Producto("9", "Tinto", 56, 800, "assets/imgs/dulce.png"));
    productos.add(new Producto("10", "Cafe", 23, 400, "assets/imgs/dulce.png"));
    productos.add(new Producto("11", "Piloncillo", 56, 1500, "assets/imgs/dulce.png"));
    productos.add(new Producto("12", "Hit", 57, 1500, "assets/imgs/dulce.png"));
    productos.add(new Producto("13", "Coca Cola", 3, 1200, "assets/imgs/dulce.png"));
    productos.add(new Producto("14", "Limonada", 10, 1500, "assets/imgs/dulce.png"));
    return productos;
  }
}
