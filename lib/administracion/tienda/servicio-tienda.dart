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
      'imagen': nuevaTienda.imagen
    }).catchError((e) {
      print(e);
    });
  }

}
