import 'package:flutter/material.dart';
import 'package:green_app/ui/views/home_view.dart';

import '../views/MLScreen.dart';

import '../views/communityScreen.dart';
import '../views/profileScreen.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0 ;

  final pages = [
    const HomeView(),
    const MLScreen(),
    const communityScreen(),
     profileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

 return Scaffold(

   bottomNavigationBar : BottomNavigationBar(
type: BottomNavigationBarType.fixed,
     showSelectedLabels: false,
     showUnselectedLabels: false,
     items: const <BottomNavigationBarItem> [

       BottomNavigationBarItem(
           label: 'home',
           icon: Icon(Icons.home,
             size: 35,
             color: Color(0xFF64A195),)
       ),

       BottomNavigationBarItem(
         label: 'ML',
           icon: Icon(Icons.camera_enhance,
             size: 35,
             color: Color(0xFF64A195),)
       ),

       BottomNavigationBarItem(
         label: 'community',
           icon: Icon(Icons.comment,
             size: 35,
             color: Color(0xFF64A195),)
       ),

       BottomNavigationBarItem(
         label: 'profile',
           icon: Icon(Icons.account_circle,
             size: 35,
             color: Color(0xFF64A195),)
       ),
     ],
     currentIndex: pageIndex,
     onTap: _onItemTapped,
   ),


   body: Center(
     child: pages.elementAt(pageIndex), //New
   ),
 );
  }
}
