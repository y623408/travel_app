
import 'package:flutter/material.dart';
import 'package:travel_app/pages/navpages/bar_item_page.dart';
import 'package:travel_app/pages/home_page.dart';
import 'package:travel_app/pages/navpages/my_page.dart';
import 'package:travel_app/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages=[
    HomePage(),//,
    //BarItemPage(),
    //SearchPage(),
    MyPage()
  ];
  int currentInd=0;
  void onTap(int index){
    setState((){
      currentInd=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentInd],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,//may not required
        unselectedFontSize: 0,//may not required
        type: BottomNavigationBarType.fixed,//shifting
        backgroundColor: Colors.white,//when using shifting,
        // no colour change in navigation bar
        onTap: onTap,
        currentIndex: currentInd,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label:"Home",icon: Icon(Icons.apps)),
          //BottomNavigationBarItem(label:"Bar",icon: Icon(Icons.bar_chart_sharp))//,
          //BottomNavigationBarItem(label:"Search",icon: Icon(Icons.search)),
          BottomNavigationBarItem(label:"My",icon: Icon(Icons.person))
        ],
      ),
    );
  }
}
