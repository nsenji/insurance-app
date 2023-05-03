import 'dart:collection';

import 'package:flutter/cupertino.dart';

class ProductTypeNotifier extends ChangeNotifier {
   List productList = [];

  // UnmodifiableListView get productList => UnmodifiableListView(_productList);

  void add(item) {
    productList.add(item);

    notifyListeners();
  }

  void removeAll(item) {
    productList.clear();

    notifyListeners();
  }
}
