import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CuadradoAnimado() ,
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({super.key});


  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin{
  
  late AnimationController controller;
  late Animation <double> rotation;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 4000));

    rotation = Tween(begin: 0.0, end: 2 * Math.pi,).animate( 
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );

    controller.addListener(() { 

      print('Status: ${controller.status}');

     if (controller.status == AnimationStatus.completed ){
     // controller.reverse();
     controller.reset();
     }
      
     
    });
    super.initState();
  }
  
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {        
        return Transform.rotate(
          angle: rotation.value,          
          child: _Rectangulo());
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: const BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}

