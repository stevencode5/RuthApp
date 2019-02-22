import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ruthapp/administracion/tienda/tienda.dart';
import 'package:ruthapp/autenticacion/servicio-autenticacion.dart';
import 'package:ruthapp/cliente/cliente.dart';

class ServicioTienda {

  ServicioAutenticacion servicioAutenticacion = new ServicioAutenticacion();

  void crearTienda(Tienda nuevaTienda) async {
    print('Entro a crear tienda ${nuevaTienda.nombre}'); 
    FirebaseUser tendero = await servicioAutenticacion.consultarUsuarioActual();   
    Firestore.instance.collection('tiendas').document().setData({
      'nombre': nuevaTienda.nombre,
      'tendero': tendero.email,
      'descripcion' : nuevaTienda.descripcion,
      'imagen': nuevaTienda.imagen
    }).catchError((e) {
      print(e);
    });
  }

  void suscribirCliente(Cliente nuevoCliente, Tienda tienda) async {
    print('Suscribiendo cliente ${nuevoCliente.nombre} para la tienda ${tienda.nombre}');
    Firestore.instance.collection('tiendas').document(tienda.id)
      .collection('clientes').document(nuevoCliente.id).setData({
        'nombre': nuevoCliente.nombre,
        'correo': nuevoCliente.correo,
        'estado': 'Pendiente',
        'imagen': nuevoCliente.imagen
      })
      .catchError((e){
        print(e);
      });
  }

  void cambiarEstadoCliente(Cliente cliente, String estado, Tienda tienda){
    Firestore.instance
      .collection('tiendas').document(tienda.id)
      .collection('clientes').document(cliente.id)
      .updateData({'estado': estado})
      .catchError((e){
        print(e);
      });        
  }

  Future<DocumentSnapshot> consultarClientePorTienda(Cliente cliente, Tienda tienda) {
    print('Consultando si el Cliente ${cliente.nombre} esta suscrito en la Tienda ${tienda.nombre}');
    return Firestore.instance
      .collection('tiendas').document(tienda.id)
      .collection('clientes').document(cliente.id)
      .get();
  }

}
