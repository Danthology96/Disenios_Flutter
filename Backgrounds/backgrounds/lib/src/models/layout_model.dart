import 'package:backgrounds/src/labs/slideshow_page.dart';
import 'package:flutter/material.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = SlideShowPage();

  Widget get currentPage => _currentPage;

  set currentPage(Widget page) {
    _currentPage = page;
    notifyListeners();
  }
}
