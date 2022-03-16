import 'package:flutter/material.dart';
import 'package:green_app/authentication.dart';

class profileScreen extends StatefulWidget {
   profileScreen({Key? key}) : super(key: key);

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
Authentication _auth = Authentication();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
          child: TextButton.icon(
            icon: Icon(Icons.person),
            style: TextButton.styleFrom(

            ),
            label: Text('Sign out'),
            onPressed: ()async {
              await _auth.signOut();
            },
          )


      ),
    );
  }
}
