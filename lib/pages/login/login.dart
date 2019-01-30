import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ruthapp/pages/login/crear-cuenta.dart';
import 'package:ruthapp/pages/login/servicio-autenticacion.dart';
import 'package:ruthapp/ruthapp.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email;
  String _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ServicioAutenticacion servicioAutenticacion = new ServicioAutenticacion();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ingresar'),
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
            _crearTextFieldEmail(),
            _crearTextFieldPassword(),
            _crearBotonIngresar(),
            _crearBotonRegistrar(),
            _crearSeparador(),
            _crearBotonIngresarGoogle()
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

  TextFormField _crearTextFieldEmail() {
    return TextFormField(
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(hintText: 'Email', icon: Icon(Icons.mail)),
      validator: (value) =>
          value.isEmpty ? 'El correo no puede estar vacio' : null,
      onSaved: (value) => this._email = value,
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

  Container _crearBotonIngresar() {
    return Container(
      padding: EdgeInsets.only(top: 35),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.blue,
        child: Text(
          'Ingresar',
          style: TextStyle(fontSize: 20.0, color: Colors.white)
        ),
        onPressed: _validarIngresar,
      )
    );
  }

  FlatButton _crearBotonRegistrar() {
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      padding: EdgeInsets.only(bottom: 35),
      child: Text(
        'Crear cuenta',
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300)
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CrearCuenta()));
      }
    );
  }

  Divider _crearSeparador() {
    return Divider(
      color: Colors.black,
      height: 20,
    );
  }

  Container _crearBotonIngresarGoogle() {
    return Container(
      child: RaisedButton(        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.blue,
        child: Row(
          children: <Widget>[
            Icon(Icons.adb),
            Text(
              'Ingresar con Google',
              style: TextStyle(fontSize: 20.0, color: Colors.white)
            )
          ],          
        ),
        onPressed: _ingresarConGoogle,
      )
    );
  }

  void _validarIngresar() {
    final _formState = _formKey.currentState;
    if (_formState.validate()) {
      _formState.save();
      servicioAutenticacion.ingresar(this._email, this._password)
        .then((usuario) => Navigator.push(context, MaterialPageRoute(builder: (context) => RuthApp())))
        .catchError((error) => _mostrarMensajeError(error.code, context));       
    }
  }

  void _mostrarMensajeError(String codigoError, BuildContext context){
    print(codigoError);
    switch(codigoError){
      case 'ERROR_INVALID_EMAIL': _mostrarMensajeAlerta('El correo no tiene formato valido', context); 
      break;
      case 'ERROR_USER_NOT_FOUND': _mostrarMensajeAlerta('Correo no registrado', context); 
      break;
      case 'ERROR_WRONG_PASSWORD': _mostrarMensajeAlerta('Contraseña incorrecta', context); 
      break;
      case 'ERROR_USER_DISABLED': _mostrarMensajeAlerta('Usuario inhabilitado, contacte al administrador', context); 
      break;
    }
  }

  void _mostrarMensajeAlerta(String mensajeError, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error de ingreso'),
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

  void _ingresarConGoogle(){
    servicioAutenticacion.ingresarConGoogle()
      .then((usuario) => _validarIngresoGoogle(usuario))
      .catchError((error) => _mostrarMensajeAlerta('Se presento un error al iniciar sesion con Google', context));    
  }

  void _validarIngresoGoogle(GoogleSignInAccount cuentaGoogle){
    print('Cuenta de google ${cuentaGoogle.displayName}');
    Navigator.push(context, MaterialPageRoute(builder: (context) => RuthApp()));
  }

}
