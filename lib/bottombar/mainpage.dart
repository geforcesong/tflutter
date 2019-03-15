import 'package:flutter/material.dart';
import 'screens/page1.dart';
import 'screens/page2.dart';
import 'screens/page3.dart';

enum LayoutType { page1, page2, page3 }

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  LayoutType _layoutSelection = LayoutType.page1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is bottom bar app"),
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildBottomNavigationBarItem(
            Icons.access_alarm, 'Page1', LayoutType.page1),
        _buildBottomNavigationBarItem(
            Icons.account_balance, 'Page2', LayoutType.page2),
        _buildBottomNavigationBarItem(Icons.adjust, 'Page3', LayoutType.page3)
      ],
      onTap: _onSelectTab,
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData icon, String text, LayoutType layoutType) {
    return BottomNavigationBarItem(
        icon: Icon(icon, color: _colorTabMatching(layoutType)),
        title:
            Text(text, style: TextStyle(color: _colorTabMatching(layoutType))));
  }

  Color _colorTabMatching(LayoutType layoutType) {
    return _layoutSelection == layoutType ? Colors.orange : Colors.grey;
  }

  void _onSelectTab(int index) {
    print(index);
    switch (index) {
      case 0:
        _onLayoutSelected(LayoutType.page1);
        break;
      case 1:
        _onLayoutSelected(LayoutType.page2);
        break;
      case 2:
        _onLayoutSelected(LayoutType.page3);
        break;
    }
  }

  void _onLayoutSelected(LayoutType selection) {
    setState(() {
      _layoutSelection = selection;
    });
  }

  Widget _buildBody() {
    switch (_layoutSelection) {
      case LayoutType.page1:
        return Page1();
        break;
      case LayoutType.page2:
        return Page2();
        break;
      case LayoutType.page3:
        return Page3();
        break;
      default:
        return null;
    }
  }
}
