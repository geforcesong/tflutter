import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';

class Avartar extends StatefulWidget{

  Avartar({this.url, this.size});
  final String url;
  final double size;

  @override
  State<StatefulWidget> createState() =>_Avartar();
}

class _Avartar extends State<Avartar> {

  Future<Uint8List> fetchAvatar() async{
    http.Response response =await http.get(widget.url);
    return response.bodyBytes;
  }

  Widget loadingWidget(){
    return new FutureBuilder<Uint8List>(
      future: fetchAvatar(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return Image.memory(snapshot.data);
        } else if(snapshot.hasError){
          print('${snapshot.error}');
          return new Center(child: Text('Error'));
        } else{
          return Container(
            padding: EdgeInsets.all(widget.size-50),
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.blue,
          width: 3
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end:Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black12
          ]
        )
      ),
      child: ClipOval(
        child: loadingWidget(),
      )
    );
  }
}