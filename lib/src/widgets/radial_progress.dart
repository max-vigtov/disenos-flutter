import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final double percentage;
  final double primaryStoke;
  final double secondaryStroke;
  final Color primaryColor;
  final Color secondaryColor;

   const RadialProgress({ 
    super.key, 
    required this.percentage, 
    this.primaryColor = Colors.blue, 
    this.secondaryColor = Colors.grey,  
    this.secondaryStroke =  4.0,  
    this.primaryStoke = 10
   });

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
            painter: _MyRadialProgress( 
              (widget.percentage - difAnimate) + (difAnimate * controller.value), 
              widget.primaryStoke,
              widget.secondaryStroke,              
              widget.primaryColor,
              widget.secondaryColor,
            ),
          )
        );
      },
    );
  }
}

class _MyRadialProgress extends CustomPainter{

  final double percentage;
  final double primaryStoke;
  final double secondaryStroke;
  final Color primaryColor;
  final Color secondaryColor;

  _MyRadialProgress( this.percentage, this.primaryStoke, this.secondaryStroke, this.primaryColor, this.secondaryColor );
  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = Rect.fromCircle(
      center: const Offset(0, 0), 
      radius: 180
    );

    const Gradient gradient = LinearGradient(
      colors: <Color> [
        Color(0xffc012FF),
        Color(0xff6D05E8),
        Colors.red
      ]
    );

    //Circle completed
    final paint = Paint()
      ..strokeWidth = 4
      ..color       = secondaryColor
      ..style       = PaintingStyle.stroke;

      final Offset center = Offset( size.height * .5, size.width * .5);
      final double radius = min(size.width * .5, size.height * .5);

      canvas.drawCircle(center, radius, paint);

      //arc
    final paintArc = Paint()
      ..strokeCap   = StrokeCap.round
      ..strokeWidth = primaryStoke
     // .. shader     = gradient.createShader(rect)
      ..color       = primaryColor
      ..style       = PaintingStyle.stroke;

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