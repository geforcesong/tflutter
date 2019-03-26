import 'package:flutter/material.dart';
class ImageGridViewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GridView.extent(
      maxCrossAxisExtent: 150,
      mainAxisSpacing: 3,
      crossAxisSpacing: 3,
      children: buildList(60)
    );
  }

  List<Widget> buildList(int numberOfTiles){
    final imageTotalCount = 10;
    List<Container> containers = new List<Container>.generate(numberOfTiles, (index){
      final imageName = 'images/samples/${(index%imageTotalCount)+1}.jpeg';
      return new Container(
        child: new Image.asset(imageName, fit: BoxFit.cover,)
      );
    });
    return containers;
  }
}