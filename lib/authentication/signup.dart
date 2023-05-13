import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:random_string/random_string.dart';

Future<bool> signUp(String emailAddress, String password, String firstname,
    String lastname) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );

    var ref = randomAlphaNumeric(5);

    var user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance.collection('users').add({
      'uniqueID': user!.uid,
      'ref': ref,
      'firstname': firstname,         // _usernameField.text.trim(),
      'lastname': lastname,
    });
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return false;
  } catch (e) {
    print(e.toString());

    return false;
  }
}
