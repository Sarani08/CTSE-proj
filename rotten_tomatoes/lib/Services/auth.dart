/* This is used for firebase authentication of user which includes login,register and signout.
Firebase authentication is referred from tutorial 
1.https://pub.dev/packages/firebase_auth
2.https://firebase.google.com/docs/flutter/setup
*/

import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

// creating a global firebase instance and using it to perform login/logout for a user
abstract class BaseAuth{
  Future<String> signIn(String email, String password);
  Future<String> signUp(String email, String password);
  Future<FirebaseUser> getCurrentUser();
  Future<void> signOut();
}


class Auth implements BaseAuth {

   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
   

  //Sign in with email and password . 
  Future<String> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  //Create user with email and password
  Future<String> signUp(String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  //get current user . https://firebase.google.com/docs/auth/android/manage-users
  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  //signout user
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}