import 'producto.dart';

class ServicioProducto {

  List<Producto> _productos;

  ServicioProducto(){
    _productos = new List<Producto>();
    _crearProductosIniciales();
  }

  void _crearProductosIniciales() {

    _productos.add(Producto.fromDatos("1", "Papas", 34, 1200, "assets/imgs/dulce.png"));
    _productos.add(Producto.fromDatos("2", "Gansito", 56, 800, "assets/imgs/dulce.png"));
    _productos.add(Producto.fromDatos("3", "Quimbaya", 23, 400, "assets/imgs/dulce.png"));
    _productos.add(Producto.fromDatos("4", "Arepa", 56, 1500, "assets/imgs/dulce.png"));
    _productos.add(Producto.fromDatos("5", "Empanada", 57, 1500, "assets/imgs/dulce.png"));
    _productos.add(Producto.fromDatos("6", "Queso", 3, 1200, "assets/imgs/dulce.png"));
    _productos.add(Producto.fromDatos("7", "Choc7orramo", 10, 1500, "assets/imgs/dulce.png"));
    
    _productos.add(Producto.fromDatos("8", "Chicarrones", 34, 1200, "assets/imgs/dulce.png"));
    _productos.add(Producto.fromDatos("9", "Tinto", 56, 800, "assets/imgs/dulce.png"));
    _productos.add(Producto.fromDatos("10", "Cafe", 23, 400, "assets/imgs/dulce.png"));
    _productos.add(Producto.fromDatos("11", "Piloncillo", 56, 1500, "assets/imgs/dulce.png"));
    _productos.add(Producto.fromDatos("12", "Hit", 57, 1500, "assets/imgs/dulce.png"));
    _productos.add(Producto.fromDatos("13", "Coca Cola", 3, 1200, "assets/imgs/dulce.png"));
    _productos.add(Producto.fromDatos("14", "Limonada", 10, 1500, "assets/imgs/dulce.png"));

  }

  List<Producto> consultarTodosProductos() {
    return this._productos;
  }

  void crearProducto(Producto producto){
    print("Producto !");
    print("Nombre ${producto.nombre}");
    print("Precio ${producto.precio}");
    print("Cantidad ${producto.cantidad}");
    print("Imagen ${producto.imagen}");

    this._productos.add(producto);
    print("Cantidad de productos ${this._productos.length}");    
  }

}
