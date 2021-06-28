import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_developer_task/constant.dart';
import 'package:flutter_developer_task/home_screen.dart';
import 'package:flutter_developer_task/next_screen.dart';

class CustomNavigationBar extends StatefulWidget {
  static const routeName = "/customNav";
  const CustomNavigationBar({ Key? key }) : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    NextPage(),
    Text("Wallet",
    style: optionStyle,),
    Text(
      'Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Badge(
          badgeContent: Text(
            '3',
            style: TextStyle(
                  color: Colors.white,
                ),
          ),
          position: BadgePosition.topStart(top: 2, start: 10),
          animationType: BadgeAnimationType.fade,
          child: const Icon(
            Icons.notifications_outlined,
            color: Colors.blue,
          ),
        ),
      ),
        ],
        title: Row(
          children: [
     Stack(
       alignment: Alignment.center,
       children: [
         Image.asset(AssetsImages.iconImage),
         Image.asset(AssetsImages.swoosh)
       ],
     ),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: const Text("SwapBeta",style: TextStyle(color:Colors.blue,fontStyle: FontStyle.italic,fontSize: 35,fontWeight: FontWeight.w800),),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'Sawp',
             backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
             backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        backgroundColor:Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}