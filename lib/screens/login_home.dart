import 'package:flutter/material.dart';

class LoginHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Logged In')),
      body: Container(
        child: Center(
          child: Text('Welcome, you logged in'),
        ),
      ),
    );
  }
}
