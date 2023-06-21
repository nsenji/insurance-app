import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


updateUser() async {
  var db = FirebaseFirestore.instance;
  var user = FirebaseAuth.instance.currentUser;

  var query = await db
      .collection("users")
      .where("uniqueID", isEqualTo: user!.uid)
      .get();

  final data = query.docs;
  data[0].reference.update({"profileComplete": true}).then(
      (value) => print('successfully updated'),
      onError: (e) => print('error while updateing $e'));
}
