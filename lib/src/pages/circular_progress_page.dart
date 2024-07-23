import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({super.key});

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          height: 300,          
          child: CustomPaint(
            painter: _MiRadialProgress(50),
          ),
        ),
      )
    );
  }
}

class _MiRadialProgress extends CustomPainter{

  final double percentage;

  _MiRadialProgress( this.percentage);
  @override
  void paint(Canvas canvas, Size size) {

    //Circle completed
    final paint = Paint()
      ..strokeWidth = 4
      ..color       = Colors.grey
      ..style       = PaintingStyle.stroke;

      final Offset center = Offset( size.height * .5, size.width * .5);
      final double radius = min(size.width * .5, size.height * .5);

      canvas.drawCircle(center, radius, paint);

      //arc
    final paintArc = Paint()
      ..strokeWidth = 10
      ..color       = Colors.pink
      ..style       = PaintingStyle.stroke;

      //

      double arcAngle = 2 * pi * ( percentage / 100 );

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius), 
        -pi / 2, 
        arcAngle, 
        false, 
        paintArc
      );

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
  
}