import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ruthapp/ruthapp.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email;
  String _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
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

  Container _crearBotonIngresar() {
    return Container(
      padding: EdgeInsets.only(top: 35),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.blue,
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20.0, color: Colors.white)
        ),
        onPressed: _validarIngresar,
      )
    );
  }

  FlatButton _crearBotonRegistrar() {
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Text(
        "Crear cuenta",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300)
      ),
      onPressed: _crearCuenta,
    );
  }

  Container _crearMensajeError() {
    return Container();
  }

  void _validarIngresar() async {
    final _formState = _formKey.currentState;
    if (_formState.validate()) {
      _formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: this._email, password: this._password);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RuthApp(user)));
      } catch (e) {
        print("Explotoooooooooooo !!");
        print(e.message);
      }
    }
  } 

  void _crearCuenta() {}

}
