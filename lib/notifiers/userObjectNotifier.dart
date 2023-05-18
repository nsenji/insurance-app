import 'package:flutter/foundation.dart';

import '../models/userObject.dart';

class UserNotifier with ChangeNotifier {
  UserObject? _user;
  // List users = [];

  UserObject? get user => _user;

  // dynamic get userList {
  //   return users;
  // }

  void setUser(UserObject user) {
    _user = user;
    notifyListeners();
  }
  // void addUser(UserObject user) {
  //   users.add(user);
  //   notifyListeners();
  // }
}