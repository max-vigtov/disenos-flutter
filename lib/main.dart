import 'package:flutter/material.dart';
import 'package:disenos_flutter/src/pages/sliver_list_page.dart';
//import 'src/pages/slideshow_page.dart';
//import 'package:disenos_flutter/src/pages/circular_graphics_page.dart';
//import 'package:disenos_flutter/src/pages/animaciones_page.dart';
//import 'package:disenos_flutter/src/labs/slideshow_page.dart';
// import 'package:disenos_flutter/src/pages/pinterest_page.dart';
// import 'package:disenos_flutter/src/pages/emergency_page.dart';
// import 'package:disenos_flutter/src/labs/circular_progress_page.dart';
// import 'package:disenos_flutter/src/challenges/animate_square_page.dart';

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
      home: const SliverListPage(),
      theme: ThemeData(brightness: Brightness.light),
    );
    }
  }
  