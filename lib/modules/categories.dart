

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cat.dart';
import 'fav.dart';
import 'filter.dart';

class Categoreos extends StatefulWidget {


  @override
  State<Categoreos> createState() => _CategoreosState();
}

class _CategoreosState extends State<Categoreos> {
  int curr=0;
  List<Widget>pages=[Cat(),Fav()];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {




    return Scaffold(
      appBar: AppBar(
      ),
      body: pages[curr],
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: null,
            ),
            ListTile(
              title: const Text('Filters'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      Filters(

                      )),
                );
              },
            ),
            ListTile(
              title: const Text('Meals'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.pinkAccent,
        onTap: (index){
          setState(() {
            curr=index;
          });
        },
        currentIndex: curr,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: "categories" ,),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "favourite"   ),

        ],
      ),
    );
  }
}
