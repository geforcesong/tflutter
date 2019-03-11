import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SearchPage extends StatelessWidget {
  final String title;
  SearchPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(this.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('hello search page')
          ],
        ),
      )
    );
  }
}