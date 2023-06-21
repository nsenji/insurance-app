import 'package:flutter/cupertino.dart';

class AllPlansNotifier extends ChangeNotifier {
  List plansList = [];

  dynamic get planList {
    return plansList;
  }

  void add(item) {
    plansList.add(item);

    notifyListeners();
  }

  void removeAll(item) {
    plansList.clear();

    notifyListeners();
  }
}
