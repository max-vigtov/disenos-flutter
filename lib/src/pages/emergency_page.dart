import 'package:disenos_flutter/src/widgets/fat_button.dart';
import 'package:disenos_flutter/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: FatButton())
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      icon: FontAwesomeIcons.plus,
      title: 'Asistencia médica',
      subTitle: 'Haz solicitado',
      color1: Color(0xff526BF6),
      color2: Color(0xff67ACF2),      
    );
  }
}