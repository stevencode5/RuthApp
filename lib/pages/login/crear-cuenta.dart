import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ruthapp/ruthapp.dart';

class CrearCuenta extends StatefulWidget {
  @override
  _CrearCuentaState createState() => _CrearCuentaState();
}

class _CrearCuentaState extends State<CrearCuenta> {
  String _email;
  String _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            _crearTextFieldEmail(),
            _crearTextFieldPassword(),
            _crearBotonRegistrarCuenta(),
            _crearMensajeError()
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

  Container _crearMensajeError() {
    return Container();
  }

  void _validaryRegistrar() {
    final _formState = _formKey.currentState;
    if (_formState.validate()) {
      _formState.save();
      FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: this._email, password: this._password)
      .then((user) => Navigator.push(context, MaterialPageRoute(builder: (context) => RuthApp(user))))
      .catchError((error) => _mostrarMensajeError(error.code, context));
    }
  } 

  void _mostrarMensajeError(String codigoError, BuildContext context){
    switch(codigoError){
      case 'ERROR_INVALID_EMAIL': _mostrarConfirmacionEliminacion('El correo no tiene formato valido', context); 
      break;
      case 'ERROR_WEAK_PASSWORD': _mostrarConfirmacionEliminacion('La contraseña es muy debil, debe de tener al menos 6 caracteres', context); 
      break;
      case 'ERROR_EMAIL_ALREADY_IN_USE': _mostrarConfirmacionEliminacion('El correo ya esta siendo usado', context); 
      break;
    }
  }

  void _mostrarConfirmacionEliminacion(String mensajeError, BuildContext context) {
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
