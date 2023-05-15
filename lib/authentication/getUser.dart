import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insurease/authentication/userObject.dart';

import '../notifiers/userObjectNotifier.dart';

getUser(UserNotifier userNotifier) {
  var db = FirebaseFirestore.instance;
  // var user = FirebaseAuth.instance.currentUser;

  final docRef = db.collection("users").doc("yxnCM9rV7cYnds1Y3MGm");
  docRef.get().then((DocumentSnapshot doc) {
    final data = doc.data();
    // List stuff = [];
    UserObject userobject = UserObject.fromMap(data);
    // stuff.add(userobject);
    // UserNotifier userNotifier = UserNotifier();
    userNotifier.setUser(userobject);
    // userNotifier.setUser(userobject);
  });
}
