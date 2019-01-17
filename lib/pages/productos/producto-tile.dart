import 'package:flutter/material.dart';
import 'package:ruthapp/pages/productos/producto.dart';

class ProductoTile extends StatelessWidget {
  Producto _producto;

  ProductoTile(this._producto);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildImagenProducto(),
        _buildDetallesProducto()
      ],
    );
  }

  Container _buildImagenProducto(){
    return Container (
      margin: EdgeInsets.only(
        top: 20.0,
        left: 20.0
      ),

      width: 80.0,
      height: 80.0,

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(this._producto.imagen)
        )
      ),

    );
  }

  Column _buildDetallesProducto(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildNombreProducto(),
        _buildPrecioProducto(),
        _buildCantidadProducto()
      ],
    );
  }

  Widget _buildNombreProducto(){
    return Container(
      margin: EdgeInsets.only(
        left: 20.0
      ),

      child: Text(
        this._producto.nombre,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: "Lato",
            fontSize: 17.0
        ),

      ),

    );
  }

  Widget _buildPrecioProducto(){
    return Container(
      margin: EdgeInsets.only(
          left: 20.0
      ),

      child: Text(
        this._producto.precio.toString(),
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Lato",
            fontSize: 13.0,
            fontWeight: FontWeight.w900
        ),

      ),

    );
  }

  Widget _buildCantidadProducto(){
    Container(
      margin: EdgeInsets.only(
        left: 20.0
    ),

      child: Text(
        this._producto.cantidad.toString(),
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Lato",
            fontSize: 13.0,
          color: Color(0xFFa3a5a7)
        ),

      ),

    );
  }




/*
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.map),
      title: Text(this._producto.nombre),
    );
  }
*/

}
