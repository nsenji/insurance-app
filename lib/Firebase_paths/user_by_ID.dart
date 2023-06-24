import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserByID extends ChangeNotifier {
  List<QueryDocumentSnapshot<Map<String, dynamic>>> _dataList = [];

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> _userById() async {
    var user = FirebaseAuth.instance.currentUser;

    var db = FirebaseFirestore.instance;

    var query = await db
        .collection("users")
        .where("uniqueID", isEqualTo: user!.uid)
        .get();

    final dataQuery = query.docs; // the dataQuery is a list and you have to access its first item which is the user object
    _dataList = dataQuery;
    notifyListeners();
    return dataQuery;
  }

  List<QueryDocumentSnapshot<Map<String, dynamic>>> get dataList => _dataList;
  get userById => _userById();
}
