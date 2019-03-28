import 'package:flutter/material.dart';
import 'avatar.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
// import 'package:firebase_messaging/firebase_messaging.dart';
class AvatarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AvatarPage();
}

class _AvatarPage extends State<AvatarPage> {
  String _name;
  static final formKey = new GlobalKey<FormState>();
  FocusNode _focusNode = new FocusNode();
  Future<Uint8List> imageData;
  // FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
  TextEditingController tokenController = new TextEditingController();

  Future<Uint8List> fetchAvatar(url) async {
    http.Response response = await http.get(url);
    return response.bodyBytes;
  }

  @override
  void initState(){
    super.initState();
    // _firebaseMessaging.configure(
    //   onMessage: (Map<String, dynamic> message){
    //     print('onMessage: $message' );
    //   },
    //   onLaunch: (Map<String, dynamic> message){
    //     print('onLaunch2: $message' );
    //   },
    //   onResume: (Map<String, dynamic> message){
    //     print('onResume2: $message' );
    //   }
    // );
    // _firebaseMessaging.getToken().then((token){
    //   print('***token start**');
    //   setState(() {
    //     tokenController.text =token;
    //   });
    //   print(token);
    //   print('***token end**');
    // });
  }

  _clear() {
    final form =formKey.currentState;
    form.reset();
    FocusScope.of(context).requestFocus(_focusNode);
  }

  @override
  Widget build(BuildContext context) {
    var children = [_buildInputForm()];

    if (_name != null && _name.length > 0) {
      var avatar = new Avartar( size: 250, imageData: imageData,);
      children.addAll([
        new VerticalPadding(child: avatar),
        new VerticalPadding(child: Text('from robohash $_name'))
      ]);
    }

    children.addAll([
      Expanded(child: Container()),
      TextField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        controller: tokenController,
      ),
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
    var url = 'https://robohash.org/$_name';
    if (form.validate()) {
      form.save();
      setState(() {
        imageData = this.fetchAvatar(url);
      });
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
