import 'package:flutter/material.dart';
import 'SelectionScreen.dart';

class AboutRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Route"),
      ),
      // Create an inner BuildContext so that the onPressed methods
      // can refer to the Scaffold with Scaffold.of().
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Navigator.pushNamed(context, '/');
                  },
                  child: Text('Go back!'),
                ),
                RaisedButton(
                  onPressed: () {
                    _navigateAndDisplaySelection(context);
                  },
                  child: Text('Open Question!'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/todos');
                  },
                  child: Text('Open Todo List'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/counterapp');
                  },
                  child: Text('Open Counter app'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/mapp');
                  },
                  child: Text('MAPP'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/logindemo');
                  },
                  child: Text('Login Demo'),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that will complete after we call
    // Navigator.pop on the Selection Screen!
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result!
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }
}
