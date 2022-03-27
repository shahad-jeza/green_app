import 'package:flutter/material.dart';
import 'package:green_app/ui/views/home_view.dart';

import '../views/MLScreen.dart';


import '../views/community_view.dart';
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
    const CommunityScreen(),
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
   appBar: AppBar(
     backgroundColor:  Colors.green[100],
     leading: Padding(
       padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
       child: Row(
         children: [
           Image(image: AssetImage('assets/icons/star.png' )  , width: 30, height: 30,),
           Padding(
             padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
             child: Text('10' , style:
               TextStyle(
                 color : Colors.black54,
                 fontWeight: FontWeight.w500,
                 fontSize: 18
               ),),
           )
         ],
       ),
     ),
     leadingWidth: 100,
     actions: const [
       Padding(
         padding: EdgeInsets.fromLTRB(0, 0, 20, 5),
         child: Image(image: AssetImage('assets/icons/man.png' ) , width: 40,height: 40,),
       )
     ],
  
   ),

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
