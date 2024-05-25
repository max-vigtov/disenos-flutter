import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  const HeaderBordesRedondeados({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,      
      decoration: const BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70)
          )
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal ({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: double.infinity,
      width: double.infinity,
     // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(), 
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = Paint();

    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 30;

    final path = Path();

    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width , size.height * 0.30);
    path.lineTo(size.width , 0);
    path.lineTo(0, 0);
    //path.lineTo(0, size.height * 0.5);    

    canvas.drawPath(path, lapiz); 
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }   
}

class HeaderTiangular extends StatelessWidget {
  const HeaderTiangular ({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: double.infinity,
      width: double.infinity,
     // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter:  _HeaderTiangularPainter(), 
      ),
    );
  }
}

class _HeaderTiangularPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = Paint();

    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill ;
    lapiz.strokeWidth = 30;

    final path = Path();

   // path.moveTo(0, 0);
    path.lineTo(size.width , size.height);
    path.lineTo(size.width , 0);
    path.lineTo(0, 0);
    //path.lineTo(0, size.height * 0.5);    

    canvas.drawPath(path, lapiz); 
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
   
}

class HeaderPico extends StatelessWidget {
  const HeaderPico ({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: double.infinity,
      width: double.infinity,
     // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter:  _HeaderPicoPainter(), 
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = Paint();

    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill  ;
    lapiz.strokeWidth = 30;

    final path = Path();

    path.lineTo(0, size.height * 0.23);
    path.lineTo(size.width * 0.5, size.height * 0.3);
    path.lineTo(size.width , size.height * 0.23);
    path.lineTo(size.width, 0);
        
    canvas.drawPath(path, lapiz); 
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
   
}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo ({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: double.infinity,
      width: double.infinity,
     // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter:  _HeaderCurvoPainter(), 
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = Paint();

    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill  ;
    lapiz.strokeWidth = 20;

    final path = Path();

    path.lineTo(0, size.height * 0.23);
    path.quadraticBezierTo(size.width * .5, size.height * .40, size.width, size.height * 0.23);
    path.lineTo(size.width, 0);
    //path.lineTo(size.width, size.height * 0.23);
     
        
    canvas.drawPath(path, lapiz); 
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
   
}

class HeaderWave extends StatelessWidget {
  const HeaderWave ({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: double.infinity,
      width: double.infinity,
     // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter:  _HeaderWavePainter(), 
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = Paint();

    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill ;
    lapiz.strokeWidth = 20;

    final path = Path();

    path.lineTo(0, size.height * 0.23);
    path.quadraticBezierTo(size.width * .25, size.height * .30, size.width * 0.52, size.height * 0.23);
    path.quadraticBezierTo(size.width * .85, size.height * .15, size.width, size.height * 0.27);

    path.lineTo(size.width, 0);
    //path.lineTo(size.width, size.height * 0.23);
     
        
    canvas.drawPath(path, lapiz); 
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
   
}

class HeaderWaveDown extends StatelessWidget {
  const HeaderWaveDown ({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: double.infinity,
      width: double.infinity,
     // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter:  _HeaderWaveDownPainter(), 
      ),
    );
  }
}

class _HeaderWaveDownPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = Paint();

    lapiz.color = const Color.fromRGBO(97, 90, 171, 1);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path = Path();
    path.moveTo(0 , size.height * .75);
   // path.lineTo(size.width, size.height * .75);
    // path.lineTo(0, size.height * 0.23);
     path.quadraticBezierTo(size.width * .2, size.height * .65, size.width * .5, size.height * .75);
     path.quadraticBezierTo(size.width * .75, size.height * .85 , size.width, size.height * .75);
     path.lineTo(size.width, size.height);
     path.lineTo(0, size.height);
     


    // path.quadraticBezierTo(size.width * .85, size.height * .15, size.width, size.height * 0.27);

    // path.lineTo(size.width, 0);
    //path.lineTo(size.width, size.height * 0.23);
     
        
    canvas.drawPath(path, lapiz); 
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
   
}
