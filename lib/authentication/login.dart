import 'package:firebase_auth/firebase_auth.dart';


Future<bool> logIn(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}
