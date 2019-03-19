import 'package:flutter/material.dart';
import 'avatar.dart';

class AvatarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AvatarPage();
}

class _AvatarPage extends State<AvatarPage> {
  String _name;
  static final formKey = new GlobalKey<FormState>();
  FocusNode _focusNode = new FocusNode();

  _clear() {
    final form =formKey.currentState;
    form.reset();
    FocusScope.of(context).requestFocus(_focusNode);
  }

  @override
  Widget build(BuildContext context) {
    var children = [_buildInputForm()];

    if (_name != null && _name.length > 0) {
      var url = 'https://robohash.org/$_name';
      var avatar = new Avartar(url: url, size: 250);
      children.addAll([
        new VerticalPadding(child: avatar),
        new VerticalPadding(child: Text('from robohash $_name'))
      ]);
    }

    children.addAll([
      Expanded(child: Container()),
      Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        VerticalPadding(
          child: FlatButton(
            child: Text('Clear', style: TextStyle(fontSize: 24)),
            onPressed: _clear,
          ),
        )
      ])
    ]);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(title: Text('Avatar Page')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }

  Widget _buildInputForm() {
    var children = [
      VerticalPadding(
          child: TextFormField(
            focusNode: _focusNode,
        decoration: InputDecoration(
            labelText: 'Enter your name',
            labelStyle: TextStyle(fontSize: 20.0)),
        style: TextStyle(fontSize: 24, color: Colors.black),
        validator: (val) => val.isEmpty ? 'Name can not be empty' : null,
        onSaved: (name) => _name = name,
        onFieldSubmitted: (name) => _updateName(name),
      ))
    ];

    return new Form(
      key: formKey,
      child: Column(children: children),
    );
  }

  void _updateName(String name) {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {});
      print("Saved: $_name");
    }
  }
}

class VerticalPadding extends StatelessWidget {
  final Widget child;
  VerticalPadding({this.child});

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: child,
    );
  }
}
