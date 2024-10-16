import 'package:disenos_flutter/src/pages/launcher_page.dart';
import 'package:disenos_flutter/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeChanger( 2 ),
      child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).getCurrenteTheme;

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App ',  
      theme: currentTheme,
      home: const LauncherPage(),
    );
    }
  }
  