import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ruthapp/administracion/tienda/tienda.dart';
import 'package:ruthapp/autenticacion/servicio-autenticacion.dart';

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

  void suscribirCliente(Tienda tienda) async {
    FirebaseUser cliente = await servicioAutenticacion.consultarUsuarioActual();
    String id = calcularIdCliente(cliente);       
    Firestore.instance
      .collection('tiendas').document(tienda.id)
      .updateData({
          'clientes.$id': 'Pendiente',
        })
      .catchError((e){
        print(e);
      });
  }

  Future<bool> esClienteSuscritoATienda(Tienda tienda) async {
    FirebaseUser cliente = await servicioAutenticacion.consultarUsuarioActual();
    String id = calcularIdCliente(cliente);
    bool existe = tienda.clientes.containsKey(id);
    print('El cliente ${cliente.email} $existe existe en la tienda ${tienda.nombre}');
    return Future.value(existe);
  }

  String calcularIdCliente(FirebaseUser cliente){
    return cliente.email.replaceAll('.', ''); 
  }

}
