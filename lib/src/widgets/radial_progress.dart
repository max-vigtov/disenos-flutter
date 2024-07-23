import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final double percentage;

   const RadialProgress({super.key, required this.percentage});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late double prevPecentage;

  @override
  void initState() {

    prevPecentage = widget.percentage;
    
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0);

    final difAnimate = widget.percentage - prevPecentage;

    prevPecentage = widget.percentage;

    return AnimatedBuilder(
      animation: controller, 
      builder:(context, child) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MyRadialProgress( (widget.percentage - difAnimate) + (difAnimate * controller.value)),
          )

        );
      },
    );

  }
}

class _MyRadialProgress extends CustomPainter{

  final double percentage;

  _MyRadialProgress( this.percentage );
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