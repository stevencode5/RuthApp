import 'package:flutter/material.dart';
import 'package:ruthapp/autenticacion/servicio-autenticacion.dart';
import 'package:ruthapp/autenticacion/usuario.dart';

class CrearCuenta extends StatefulWidget {
  @override
  _CrearCuentaState createState() => _CrearCuentaState();
}

class _CrearCuentaState extends State<CrearCuenta> {
  
  String _nombre;
  String _correo;
  String _password;
  String _imagen;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ServicioAutenticacion servicioAutenticacion = new ServicioAutenticacion();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nueva cuenta'),
        ),
        body: _creaFormulario());
  }

  Container _creaFormulario() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          children: <Widget>[
            _crearLogo(),
            _crearTextFieldNombre(),
            _crearTextFieldEmail(),
            _crearTextFieldPassword(),
            _crearTextFieldImagen(),
            _crearBotonRegistrarCuenta()            
          ],
        ),
      ),
    );
  }

  Hero _crearLogo() {
    return Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 40.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('assets/imgs/LogoFlutter.png'),
        ),
      ),
    );
  }

  TextFormField _crearTextFieldNombre() {
    return TextFormField(
      maxLines: 1,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(hintText: 'Nombre', icon: Icon(Icons.perm_contact_calendar)),
      validator: (value) =>
          value.isEmpty ? 'El nombre no puede estar vacio' : null,
      onSaved: (value) => this._nombre = value,
    );
  }

  TextFormField _crearTextFieldEmail() {
    return TextFormField(
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(hintText: 'Email', icon: Icon(Icons.mail)),
      validator: (value) =>
          value.isEmpty ? 'El correo no puede estar vacio' : null,
      onSaved: (value) => this._correo = value,
    );
  }

  TextFormField _crearTextFieldPassword() {
    return TextFormField(
      maxLines: 1,
      obscureText: true,
      autofocus: false,
      decoration:
          InputDecoration(hintText: 'Contraseña', icon: Icon(Icons.lock)),
      validator: (value) =>
          value.isEmpty ? 'La contraseña no puede estar vacia' : null,
      onSaved: (value) => this._password = value,
    );
  }

  TextFormField _crearTextFieldImagen() {
    return TextFormField(
      maxLines: 1,
      keyboardType: TextInputType.url,
      autofocus: false,
      decoration: InputDecoration(hintText: 'Imagen', icon: Icon(Icons.image)),
      validator: (value) =>
          value.isEmpty ? 'La imagen no puede estar vacia' : null,
      onSaved: (value) => this._imagen = value,
    );
  }

  Container _crearBotonRegistrarCuenta() {
    return Container(
      padding: EdgeInsets.only(top: 35),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.blue,
        child: Text(
          'Crear Cuenta',
          style: TextStyle(fontSize: 20.0, color: Colors.white)
        ),
        onPressed: _validaryRegistrar
      )
    );
  }

  void _validaryRegistrar() {
    final _formState = _formKey.currentState;
    if (_formState.validate()) {
      _formState.save();
      Usuario nuevoUsuario = new Usuario(this._nombre, this._correo, this._password, this._imagen);      
      servicioAutenticacion.crearCuenta(nuevoUsuario)
        .then((usuario){
          Navigator.of(context).pushReplacementNamed('/general/home-inicio');
        })
        .catchError((error){
          _mostrarMensajeError(error.code, context);
        });    
    }
  } 

  void _mostrarMensajeError(String codigoError, BuildContext context){
    switch(codigoError){
      case 'ERROR_INVALID_EMAIL': _mostrarMensajeAlerta('El correo no tiene formato valido', context); 
        break;
      case 'ERROR_WEAK_PASSWORD': _mostrarMensajeAlerta('La contraseña es muy debil, debe de tener al menos 6 caracteres', context); 
        break;
      case 'ERROR_EMAIL_ALREADY_IN_USE': _mostrarMensajeAlerta('El correo ya esta siendo usado', context); 
        break;
      default:
        print(codigoError);
        _mostrarMensajeAlerta('Se presento un error', context); 
    }
  }

  void _mostrarMensajeAlerta(String mensajeError, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error de registro'),
          content: Text(mensajeError),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              }
            )            
          ],
        );
      },
    );
  }

}
