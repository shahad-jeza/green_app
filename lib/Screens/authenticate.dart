import 'package:flutter/material.dart';
import 'package:green_app/Screens/Login/login_screen.dart';
import 'package:green_app/Screens/signup/signup_screen.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true ;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return LoginScreen(toggleView : toggleView);
    }else{
      return SignUpScreen(toggleView : toggleView);
    }

  }
}
