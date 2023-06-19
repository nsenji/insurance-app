import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/userObject.dart';
import '../notifiers/userObjectNotifier.dart';

getUser(UserNotifier userNotifier) async {
  var db = FirebaseFirestore.instance;
  var user = FirebaseAuth.instance.currentUser;

  var query = await db
      .collection("users")
      .where("uniqueID", isEqualTo: user!.uid).get();

  final data = query.docs;
  // List stuff = [];
  if (data.isNotEmpty) {
    UserObject userobject = UserObject.fromMap(data[0].data());
    // stuff.add(userobject);
    // UserNotifier userNotifier = UserNotifier();
    userNotifier.setUser(userobject);
  } else {
    print('Its empty');
  }
  // userNotifier.setUser(userobject);
}
