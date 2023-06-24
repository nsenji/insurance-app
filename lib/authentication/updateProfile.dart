import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insurease/authentication/getUser.dart';
import 'package:insurease/notifiers/userObjectNotifier.dart';

import '../Firebase_paths/user_by_ID.dart';

Future<bool> updateProfile(UserNotifier userNotifier, UserByID userByID,
    String firstname, String lastname, String email) async {
  try {
    final data = userByID.dataList;

    data[0].reference.update({
      "email": email,
      "firstname": firstname,
      "lastname": lastname
    }).then((value) => print('successfully updated'),
        onError: (e) => print('error while updateing $e'));
    getUser(userNotifier, userByID);
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> updatePicture(String url, UserByID userByID,
) async {
  try {
    final data = userByID.dataList;

    data[0].reference.update({
      "profilePicture": url,
      
    }).then((value) => print('successfully updated'),
        onError: (e) => print('error while updateing $e'));
    return true;
  } catch (e) {
    return false;
  }
}


