import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier{
  
  double _currentPage = 0;

  double get currentPage => _currentPage;

  set setCurrentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }
}