import 'package:flutter/material.dart';

class AnimateSquarePage extends StatelessWidget {
  const AnimateSquarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: AnimateSquare()),
    );
  }
}

class AnimateSquare extends StatefulWidget {
  const AnimateSquare({
    super.key,
  });

  @override
  State<AnimateSquare> createState() => _AnimateSquareState();
}

class _AnimateSquareState extends State<AnimateSquare> with SingleTickerProviderStateMixin{
  

  late AnimationController controller;
  late Animation<double> moveRight;
  late Animation<double> moveUp;
  late Animation<double> moveLeft;
  late Animation<double> moveDown;

  @override
  void initState() {

    controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 4500)
    );

    moveRight = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(.0, .25, curve: Curves.bounceOut))
    );

    moveUp = Tween(begin: 0.00, end: 100.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(.25, 0.50, curve: Curves.bounceOut))
    );    

    moveLeft = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.50, 0.75, curve: Curves.bounceOut))
    );  

    moveDown = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(.75, 1.0, curve: Curves.bounceOut))
    );  

    controller.addListener(() {
      if(controller.status == AnimationStatus.completed){
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
      child: _Rectangulo(),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(moveRight.value - moveLeft.value, moveDown.value - moveUp.value),
          child: _Rectangulo(),
        );
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