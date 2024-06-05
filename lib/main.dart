import 'package:disenos_flutter/src/pages/animaciones_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App ',  
      home: const AnimacionesPage(),
      theme: ThemeData(brightness: Brightness.dark),
    );
    }
  }
  