import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:green_app/locator.dart';


import '../models/appUser.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;





  Future loginWithEmail({
    @required String email,
    @required String password
  }) async {
    try {
      var user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return user != null;
    } catch (e) {
      return e.message;
    }
  }
  Future signUpWithEmail({
    @required String email,
    @required String password,
    @required String fullName,
    @required String role,
  }) async{
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  //login statues
  Future<bool> isUserLoggedIn() async {
    var user = _firebaseAuth.currentUser != null;
    return user ;
  }


}