import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider extends ChangeNotifier {
  var _position;

  Position get position => _position;

  bool get isEmpty {
    if ( _position == null) {
      return true;
    } else {
      return false;
    }
  }

  void updatePosition(Position newPosition) {
    _position = newPosition;

    notifyListeners();
  }
}
