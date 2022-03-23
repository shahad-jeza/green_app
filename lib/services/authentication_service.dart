import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:green_app/locator.dart';
import 'package:green_app/services/fireStoreService.dart';

import '../models/appUser.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  appUser _currentUser;
  //appUser get currentUser => _currentUser;

  //Future _populateCurrentUser(User user) async {
  //  if (user != null) {
  //    _currentUser = await _firestoreService.getUser(user.uid);
   // }
 // }


  Future loginWithEmail({
    @required String email,
    @required String password
  }) async {
    try {
      var user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      //await _populateCurrentUser(authResult.user);
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

      _currentUser = appUser(

              id:authResult.user.uid,
              email:email,
              fullName:fullName,
              userRole: role
      );
      await _firestoreService.createUser(_currentUser);
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