import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerNavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Drawer Menu"),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'DOGS'),
              Tab(text: 'CATS', icon: Icon(Icons.music_note)),
              Tab(text: 'BIRDS', icon: Icon(Icons.search)),
            ],
          ),
        ),
        drawer: SafeArea(
          child: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  currentAccountPicture: Image.asset("pizza.jpg"),
                  accountEmail: Text("email@email.com"),
                  accountName: Text("Carlos"),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Item 1'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Item 2'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.label),
                  title: Text('Item 3'),
                  onTap: () {},
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Label',
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.bookmark),
                  title: Text('Item A'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('DOGS')),
            Center(child: Text('CATS')),
            Center(child: Text('BIRDS')),
          ],
        ),
      ),
    );
  }
}
