import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class HeroHeader implements SliverPersistentHeaderDelegate {
  HeroHeader({
    this.minExtent,
    this.maxExtent,
  });
  double maxExtent;
  double minExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'images/hero/ronnie-mayo-361348-unsplash.jpg',
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black54,
              ],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        Positioned(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
          child: Text(
            'Hero Image',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
}

class Page2 extends StatelessWidget{
  final List<String> assetNames = [
    'images/hero/brady-bellini-212790-unsplash.jpg',
    'images/hero/stefan-stefancik-105587-unsplash.jpg',
    'images/hero/simon-fitall-530083-unsplash.jpg',
    'images/hero/anton-repponen-99530-unsplash.jpg',
    'images/hero/kevin-cochran-524957-unsplash.jpg',
    'images/hero/samsommer-72299-unsplash.jpg',
    'images/hero/simon-matzinger-320332-unsplash.jpg',
    'images/hero/meng-ji-102492-unsplash.jpg',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _scrollView(context)
    );
  }

  Widget _scrollView(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: HeroHeader(
              minExtent: 150.0,
              maxExtent: 250.0
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
              childAspectRatio: 0.75,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  padding: _edgeInsetsForIndex(index),
                  child: Image.asset(
                    assetNames[index % assetNames.length],
                  ),
                );
              },
              childCount: assetNames.length * 2,
            ),
          )
        ],
      ),
    );
  }

  EdgeInsets _edgeInsetsForIndex(int index) {
    if (index % 2 == 0) {
      return EdgeInsets.only(top: 4.0, left: 8.0, right: 4.0, bottom: 4.0);
    } else {
      return EdgeInsets.only(top: 4.0, left: 4.0, right: 8.0, bottom: 4.0);
    }
  }
}