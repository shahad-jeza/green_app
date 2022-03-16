import 'package:firebase_auth/firebase_auth.dart';
class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<UserModel?> get onAuthStateChanged{
    return _auth.authStateChanges()
    //.map((User? user) => _userModelFromFirebase(user));
        .map(_userModelFromFirebase);
  }

  //create an userModel object based on Firebase User object
  UserModel? _userModelFromFirebase(User? user){
    if (user != null) {
      return UserModel(uid: user.uid);
    } else {
      return null;
    }
  }

  // sign in
  //sing in with email & password
  Future signIn(String email, String password) async{
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign up with email & password
  Future signUp(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user!;

      return _userModelFromFirebase(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //sing out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

}

class UserModel {
  final String uid;

  UserModel({required this.uid});
}
