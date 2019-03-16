import 'package:flutter/material.dart';
import 'auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';

enum PageStatus { Login, Create }

class LoginPage extends StatefulWidget {
  BathAuth _auth;
  PageStatus _pageStatus = PageStatus.Login;

  LoginPage(this._auth);

  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;
  final formKey = new GlobalKey<FormState>();

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      // try {
      //   FirebaseUser user = await FirebaseAuth.instance
      //       .signInWithEmailAndPassword(email: _email, password: _password);
      //   print('Login: ${user.uid}');
      // } catch (e) {
      //   print('Error: $e');
      // }
      bool flag = widget._auth.loginWithEmailAndPassword(_email, _password);
      print(flag);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text('Flutter login demo'),
        ),
        body: new Container(
          padding: EdgeInsets.all(16.0),
          child: new Form(
              key: formKey,
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _buildInputs() + _buildButtons())),
        ));
  }

  List<Widget> _buildInputs() {
    return [
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Email'),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value,
        textInputAction: TextInputAction.none,
      ),
      new TextFormField(
          obscureText: true,
          validator: (value) =>
              value.isEmpty ? 'Password can\'t be empty' : null,
          decoration: new InputDecoration(labelText: 'Password'),
          onSaved: (value) => _password = value)
    ];
  }

  List<Widget> _buildButtons() {
    if (widget._pageStatus == PageStatus.Login) {
      return [
        new RaisedButton(
          child: new Text('Login', style: TextStyle(fontSize: 20)),
          onPressed: validateAndSubmit,
        ),
        new FlatButton(
          child: Text('Create Account', style: TextStyle(fontSize: 20)),
          onPressed: () => flatPressed(PageStatus.Create),
        )
      ];
    } else {
      return [
        new RaisedButton(
          child: new Text('Create Account', style: TextStyle(fontSize: 20)),
          onPressed: validateAndSubmit,
        ),
        new FlatButton(
          child: Text('Login', style: TextStyle(fontSize: 20)),
          onPressed: () => flatPressed(PageStatus.Login),
        )
      ];
    }
  }

  void flatPressed(PageStatus status) {
    var form = formKey.currentState;
    form.reset();
    setState(() {
      widget._pageStatus = status;
    });
  }
}
