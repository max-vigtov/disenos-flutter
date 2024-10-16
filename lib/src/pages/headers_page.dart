import 'package:disenos_flutter/src/theme/theme.dart';
import 'package:disenos_flutter/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({super.key});

  @override
  Widget build(BuildContext context) {

    final accentColor = Provider.of<ThemeChanger>(context).getCurrenteTheme.colorScheme.primary;

    return Scaffold(
      body: HeaderWave( color: accentColor ),      
    );
  }
}

