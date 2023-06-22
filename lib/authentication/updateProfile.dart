import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insurease/authentication/getUser.dart';
import 'package:insurease/notifiers/userObjectNotifier.dart';

Future<bool> updateProfile(UserNotifier userNotifier,
    String firstname, String lastname, String email) async {
  var db = FirebaseFirestore.instance;
  var user = FirebaseAuth.instance.currentUser;

  var query = await db
      .collection("users")
      .where("uniqueID", isEqualTo: user!.uid)
      .get();
  try {
    final data = query.docs;

    data[0].reference.update({
      "email": email,
      "firstname": firstname,
      "lastname": lastname
    }).then((value) => print('successfully updated'),
        onError: (e) => print('error while updateing $e'));
    getUser(userNotifier);
    return true;
  } catch (e) {
    return false;
  }
}
