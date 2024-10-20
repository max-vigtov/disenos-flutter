import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier{
  bool _darkTheme = false;
  bool _customTheme = false;  
  late ThemeData _currenteTheme;

  bool get getDarkTheme => _darkTheme;
  bool get getCustomTheme => _customTheme;  
  ThemeData get getCurrenteTheme => _currenteTheme;

  ThemeChanger( int theme) {
    switch ( theme ) {
      case 1:
        _darkTheme = false;
        _customTheme = false;        
        _currenteTheme = ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 211, 235, 255),
        ), 
          colorScheme: const ColorScheme.light().copyWith(
            primary: const Color(0xff48A0EB),
          ),
        );
        break;

      case 2:
        _darkTheme = true;
        _customTheme = false;        
        _currenteTheme = ThemeData.dark();
        break;

      case 3:
        _darkTheme = true;
        _customTheme = false;
        break;           
        
      default:
        _darkTheme = false;
        _customTheme = false;
        _currenteTheme = ThemeData.light();
    }
  }
  
  set setDarkTheme ( bool value ){
    _customTheme = false;
    _darkTheme = value;

    if ( value ) {
      _currenteTheme = ThemeData.dark();
    } else {
        _currenteTheme = ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 211, 235, 255),
        ),          
          colorScheme: const ColorScheme.light().copyWith(
            primary: const Color(0xff48A0EB),            
          ),
        );      
    }
    notifyListeners();
  }

  set setCustomTheme ( bool value ){
    _customTheme = value;
    _darkTheme = false;

    if ( value ) {
      _currenteTheme = ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff16202b),
        primaryColorLight: Colors.white,
        textTheme: const TextTheme(
          bodyLarge:  TextStyle( color: Colors.white )
        ),
        colorScheme: const ColorScheme.dark().copyWith(
          primary: const Color(0xff48A0EB)
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData( 
          backgroundColor: Color(0xff48A0EB) )
      );
    } else {
      _currenteTheme = ThemeData.light();
    }

    notifyListeners();
  }  
}