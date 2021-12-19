import 'package:flutter/material.dart';

class ShoeModel with ChangeNotifier {
  String _assetImageUrl = 'assets/imgs/azul.png';
  double _shoeSize = 9.0;

  String get assetImageUrl => _assetImageUrl;
  double get shoeSize => _shoeSize;

  set assetImageUrl(String value) {
    _assetImageUrl = value;
    notifyListeners();
  }

  set shoeSize(double value) {
    _shoeSize = value;
    notifyListeners();
  }
}
