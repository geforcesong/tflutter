import 'package:flutter/material.dart';
import 'SelectionScreen.dart';

class NavigationLinkData {
  String name;
  String link;
  NavigationLinkData(this.name, this.link);
}

class AboutRoute extends StatelessWidget {
  final List<NavigationLinkData> links = new List<NavigationLinkData>();

  AboutRoute() {
    links.add(new NavigationLinkData('Sample UI', '/home'));
    links.add(new NavigationLinkData('Open Todo List', '/todos'));
    links.add(new NavigationLinkData('Open Counter app', '/counterapp'));
    links.add(new NavigationLinkData('Mapp', '/mapp'));
    links.add(new NavigationLinkData('Login Demo', '/logindemo'));
    links.add(new NavigationLinkData('Show Dialogue', 'showdialogue'));
    links.add(new NavigationLinkData('Bottom Bars', '/bottombar'));
    links.add(new NavigationLinkData('Robohash Avatar', '/robohash'));
    links.add(new NavigationLinkData('Notes App', '/notes'));
  }

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
              child: ListView.builder(
            itemCount: links.length,
            itemBuilder: (context, index) {
              var item = links[index];
              return Container(
                  decoration: BoxDecoration(
                      color: index % 2 == 0 ? Colors.white : Colors.yellow[100]),
                  child: ListTile(
                    title: Text(item.name),
                    leading: Icon(Icons.ac_unit),
                    onTap: () {
                      if (item.link == 'showdialogue') {
                        _navigateAndDisplaySelection(context);
                      } else {
                        Navigator.pushNamed(context, item.link);
                      }
                    },
                  ));
            },
          ));
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
