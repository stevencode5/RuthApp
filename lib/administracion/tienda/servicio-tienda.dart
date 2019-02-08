import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ruthapp/pages/administracion/tienda.dart';
import 'package:ruthapp/pages/login/servicio-autenticacion.dart';

class ServicioTienda {

  ServicioAutenticacion servicioAutenticacion = new ServicioAutenticacion();

  void crearTienda(Tienda nuevaTienda) async {
    print('Entro a crear tienda ${nuevaTienda.nombre}'); 
    FirebaseUser tendero = await servicioAutenticacion.getUsuarioActual();   
    Firestore.instance.collection('tiendas').document().setData({
      'nombre': nuevaTienda.nombre,
      'tendero': tendero.email,
      'imagen': nuevaTienda.imagen
    }).catchError((e) {
      print(e);
    });
  }

}
