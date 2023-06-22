import 'package:flutter/foundation.dart';

import '../models/userObject.dart';

class UserNotifier with ChangeNotifier {
  UserObject _user  = UserObject();

  UserObject get user => _user;

  void setUser(UserObject user) {
    _user = user;
    notifyListeners();
  }
 
}
