import 'package:flutter/material.dart';
import 'package:finder_search/screens/P_open.dart';
import 'package:finder_search/screens/Page_2.dart';
import 'package:finder_search/screens/Page_1.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextStyle myStyle2 = TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold);

  int currentIndex = 0;
  List pages = [pageone(),pagetwo()];
  @override
  Widget build(BuildContext context) {

    Widget bottomNavBar = BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index){
          setState(() {
            currentIndex = index;
          });
        },
        items: [

          BottomNavigationBarItem(icon: Icon(Icons.account_circle),title: Text('Account',style: myStyle2,)),
          BottomNavigationBarItem(icon: Icon(Icons.search),title: Text('Search',style: myStyle2)),

        ]);
    return Scaffold(

      body: pages[currentIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
