import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class FirebaseAuthService extends ChangeNotifier {

  Stream<User?> get authStateChanges =>     //  Stream(User?): the User? in the brackets of the stream means that stream keeps 
      FirebaseAuth.instance.authStateChanges();   // returning user authentication state
}
