import 'package:flutter/material.dart';


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
        padding: const EdgeInsets.fromLTRB(0, 300, 0, 0),
        child: Column(
          children: [
            TextButton.icon(
              icon: Icon(Icons.person),
              style: TextButton.styleFrom(

              ),
              label: Text('Sign out'),
              onPressed: ()async {
              },
            )
          ],


        ),
      ),
    );
  }
}
