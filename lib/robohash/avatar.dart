import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';

class Avartar extends StatefulWidget {
  Avartar({this.url, this.size});
  final String url;
  final double size;

  @override
  State<StatefulWidget> createState() => _Avartar();
}

class _Avartar extends State<Avartar> {
  Uint8List imageData;
  String imageUrl;

  Future<Uint8List> fetchAvatar() async {
    // print('widgetUrl: ${widget.url}');

    if(imageUrl ==widget.url){
      return imageData;
    }

    var start = DateTime.now();
    // await Future.delayed(const Duration(seconds: 4));
    http.Response response = await http.get(widget.url);
    var end = DateTime.now();
    var difference = end.difference(start);
    imageData =response.bodyBytes;
    imageUrl =widget.url;
    print('cost: ${difference.inMilliseconds}, url:${imageUrl}');
    return response.bodyBytes;
  }

  Widget loadingWidget() {
    return new FutureBuilder<Uint8List>(
      future: fetchAvatar(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.active:
          case ConnectionState.none:
            return Container(
              padding: EdgeInsets.all(widget.size - 200),
              child: CircularProgressIndicator(),
            );
            break;
          default:
            if (imageData!=null) {
              return Image.memory(snapshot.data);
            } else if (snapshot.hasError) {
              print('${snapshot.error}');
              return new Center(child: Text('Error'));
            }
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
            border: Border.all(color: Colors.blue, width: 3),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black12])),
        child: ClipOval(
          child: loadingWidget(),
        ));
  }
}
