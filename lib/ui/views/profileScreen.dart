import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../constants.dart';

class profileScreen extends StatefulWidget {
   profileScreen({Key key}) : super(key: key);

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      color: Colors.green[50],
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          children:  [
            Image(image: AssetImage('assets/icons/man.png' ) , width: 80,height: 80,),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('User Name' ,
              style: TextStyle(
                  color : Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: 18
              ),),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 15),
              child: Text('You’ve Recycled 10 Killograms' ,
                style: TextStyle(
                    color : Colors.teal,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                ),),
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 0, 40, 5),
                  child: Image(image: AssetImage('assets/icons/lighting.png' ) , width: 40,height: 40,),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 40, 5),
                  child: Image(image: AssetImage('assets/icons/tree.png' ) , width: 40,height: 40,),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 5),
                  child: Image(image: AssetImage('assets/icons/drop.png' ) , width: 40,height: 40,),
                ),
              ],
            ),

            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 5),
                  child: Text('''Saved 100 Watts
 of energy''',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color : Colors.teal,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),)
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 20, 5),
                  child: Text('Saved 17 trees',
                    style: TextStyle(
                      color : Colors.teal,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),)
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: Text('''Saved 24 Gallons
 of water''',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color : Colors.teal,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),)
                ),
              ],
            )

          ],


        ),
      ),
    );
  }
}
