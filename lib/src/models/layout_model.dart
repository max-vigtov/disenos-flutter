import 'package:disenos_flutter/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

class LayoutModel with ChangeNotifier{
  Widget _currentPage = const SlideshowPage();

  set setCurrentPage( Widget page ){
    _currentPage = page;
    notifyListeners();
  }

  Widget get getCurrentPage => _currentPage;

}