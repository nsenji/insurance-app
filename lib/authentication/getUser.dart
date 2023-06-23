import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Firebase_paths/user_by_ID.dart';
import '../models/userObject.dart';
import '../notifiers/userObjectNotifier.dart';

getUser(UserNotifier userNotifier, UserByID userByID) async {
  // var db = FirebaseFirestore.instance;
  // var user = FirebaseAuth.instance.currentUser;

  // var query = await db
  //     .collection("users")
  //     .where("uniqueID", isEqualTo: user!.uid).get();

  // final data = query.docs;
  // final userbyid = Provider.of<UserByID>(context, listen: false);
  final data =  userByID.dataList;
  if (data.isNotEmpty) {
    UserObject userobject = UserObject.fromMap(data[0].data());

    userNotifier.setUser(userobject);
  } else {
    print('Its empty');
  }
}
