import 'package:flutter/cupertino.dart';

class ProductTypeNotifier extends ChangeNotifier {
  List productList = [];

  dynamic get prodList {
    return productList;
  }

  void add(item) {
    productList.add(item);

    notifyListeners();
  }

  void removeAll(item) {
    productList.clear();

    notifyListeners();
  }
}
