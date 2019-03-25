import 'package:flutter/material.dart';
import 'dart:typed_data';

class Avartar extends StatelessWidget {
  Avartar({this.size, this.imageData});
  // final String url;
  final double size;
  final Future<Uint8List> imageData;

  // Future<Uint8List> fetchAvatar() async {
  //   http.Response response = await http.get(widget.url);
  //   return response.bodyBytes;
  // }

  Widget loadingWidget() {
    return new FutureBuilder<Uint8List>(
      future: imageData,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.active:
          case ConnectionState.none:
            return Container(
              padding: EdgeInsets.all(this.size - 200),
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
        width: this.size,
        height: this.size,
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
