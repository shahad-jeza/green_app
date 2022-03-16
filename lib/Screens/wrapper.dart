import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_app/Screens/Welcome/Welcome_screen.dart';
import 'package:green_app/Screens/authenticate.dart';
import 'package:green_app/Screens/home/bar.dart';
import 'package:green_app/authentication.dart';
import 'package:provider/provider.dart';

class wrapper extends StatelessWidget {
  const wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final userModel = Provider.of<UserModel?>(context);

    // either home or login page
    if(userModel == null){
      return const Authenticate();
    }else{
      return  Home();
    }
  }
}
