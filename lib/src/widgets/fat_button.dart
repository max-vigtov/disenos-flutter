import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FatButton extends StatelessWidget {
  const FatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        _FatButtonBackground(),
       
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(height: 140, width: 40,),
             FaIcon(
                FontAwesomeIcons.carBurst,
                size: 40,
                color: Colors.white,
              ),
             SizedBox(width: 20),              
             Expanded(child: Text('Motor Accident', style: TextStyle( color: Colors.white, fontSize: 18))),
             FaIcon( FontAwesomeIcons.chevronRight, color: Colors.white,),
             SizedBox(width: 40)

          ],
        )
      ],
    );
  }
}

class _FatButtonBackground extends StatelessWidget {
  const _FatButtonBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all( 20 ),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow( 
            color: Colors.black12, 
            offset: Offset(4, 6), 
            blurRadius: 10 
          )
        ],
        borderRadius: BorderRadius.circular( 15 ),
        gradient: const LinearGradient(
          colors: [
          Color(0xff6989f5),
          Color(0xff906ef5),
        ])
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular( 15 ),
        child: const Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                FontAwesomeIcons.carBurst,
                size: 150,
                color: Colors.white24,
              )
            )
          ],
        ),
      ),      
    );
  }
}
