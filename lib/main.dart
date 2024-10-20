import 'package:disenos_flutter/src/models/layout_model.dart';
import 'package:disenos_flutter/src/pages/launcher_page.dart';
import 'package:disenos_flutter/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/pages/launcher_tablet_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>( create:(_) => ThemeChanger( 2 ) ),
        ChangeNotifierProvider<LayoutModel>( create:(_) => LayoutModel() )        
      ],
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
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final screenSize = MediaQuery.of(context).size;
          
          if (screenSize.width > 500) {
            return const LauncherTabletPage();
            } else {
              return const LauncherPage();
            }
        },
      ),
    );
    }
  }
  