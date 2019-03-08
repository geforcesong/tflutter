import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/CartModel.dart';

class LoginScreen extends StatelessWidget {

void onLoginSubmit(BuildContext context) {
    // Here the UI doesn't depend on the state of the model. We only need
    // the model to call a method on it. Therefore, we use ScopedModel.of
    // instead of a ScopedModelDescendant widget.
    var cart = ScopedModel.of<CartModel>(context);

    // Now that we have reference to the cart, we can clear it, for example.
    cart.clear();

    // Navigate to the catalog screen.
    Navigator.pushReplacementNamed(context, '/catalog');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome', style: Theme.of(context).textTheme.display4),
            
            _LoginTextField(hintText: 'Login'),
            _LoginTextField(hintText: 'Password', obscureText: true),
            FlatButton(
              // Here we call the method above. We need to provide
              // `context` because that's how ScopedModel.of() reaches
              // the model.
              onPressed: () => onLoginSubmit(context),
              color: Colors.yellow,
              child: Text('ENTER'),
            )
          ],
        ),
      ),
    ));
  }
}

/// Convenience widget for the login text fields.
class _LoginTextField extends StatelessWidget {
  final String hintText;

  final bool obscureText;

  _LoginTextField({
    Key key,
    @required this.hintText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.black12,
      ),
      obscureText: obscureText,
    );
  }
}
