class Producto {
  String id;
  String nombre;
  int cantidad;
  int precio;
  String imagen;

  Producto();

  Producto.fromDatos(String id, String nombre, int cantidad, int precio, String imagen){
    this.id = id;
    this.nombre = nombre;
    this.cantidad = cantidad;
    this.precio = precio;
    this.imagen = imagen;
  }

}
