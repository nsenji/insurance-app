import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Stream<QuerySnapshot> picture() {
  var user = FirebaseAuth.instance.currentUser;
  var query = FirebaseFirestore.instance
      .collection("users")
      .where("uniqueID", isEqualTo: user!.uid)
      .snapshots();
  return query;
}


