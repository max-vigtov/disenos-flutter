import 'package:disenos_flutter/src/widgets/fat_button.dart';
import 'package:disenos_flutter/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {

    bool isLarge;
    if (MediaQuery.of(context).size.height > 550) {
      isLarge = true;
    } else {
      isLarge = false;
    }    

  final items = <ItemBoton>[
    ItemBoton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
    ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
    ItemBoton( FontAwesomeIcons.mask, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
    ItemBoton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
    ItemBoton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
    ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
    ItemBoton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
    ItemBoton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
    ItemBoton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
    ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
    ItemBoton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
    ItemBoton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
  ];

  List<Widget> itemMap = items.map(
    (item) => FatButton(
      text: item.texto, 
      icon: item.icon,
      color1: item.color1,
      color2: item.color2,
      onPress: (){}
    )
  ).toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: ( isLarge ) ? 220 : 10),
            child: SafeArea(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  if( isLarge )
                  const SizedBox(height: 80),
                  ...itemMap
                ],
              ),
            )
            
          ),
          if( isLarge )
          const IconHeader(
            icon: FontAwesomeIcons.plus,
            color1: Color(0xff536CF6),
            color2: Color(0xff66A9F2), 
            title: 'Asistencia Médica', 
            subTitle: 'Haz Solicitado'
          )
        ],
      )
    );
  }
}

class FatButtonTemp extends StatelessWidget {
  const FatButtonTemp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FatButton(
      icon: FontAwesomeIcons.carBurst,
      color1: const Color(0xFF6989F5),
      color2: const Color(0xFF906EF5),
      text: 'Motor Accident', 
      onPress: () {
        print("Click!");
      },);
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