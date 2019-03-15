import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
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
                children: <Widget>[
                  new TextFormField(
                    decoration: new InputDecoration(labelText: 'Email'),
                    validator: (value) =>
                        value.isEmpty ? 'Email can\'t be empty' : null,
                    onSaved: (value) => _email = value,
                  ),
                  new TextFormField(
                      obscureText: true,
                      validator: (value) =>
                          value.isEmpty ? 'Password can\'t be empty' : null,
                      decoration: new InputDecoration(labelText: 'Password'),
                      onSaved: (value) => _password = value),
                  new RaisedButton(
                    child: new Text('Login', style: TextStyle(fontSize: 20)),
                    onPressed: validateAndSubmit,
                  )
                ],
              )),
        ));
  }
}
