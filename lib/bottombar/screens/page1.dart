import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  Widget _buildPage(int index, Color color) {
    return Container(
        alignment: AlignmentDirectional.center,
        color: color,
        child: Text('$index',
            style: TextStyle(fontSize: 132, color: Colors.white)));
  }

  Widget _buildPageView() {
    return PageView(
      children: [
        _buildPage(1, Colors.green),
        _buildPage(2, Colors.blue),
        _buildPage(3, Colors.indigo),
        _buildPage(4, Colors.red),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("This is bottom bar app"),
        ),
        body: _buildPageView());
  }
}
