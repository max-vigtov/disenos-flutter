import 'package:disenos_flutter/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(child: MySlideShow()),
          Expanded(child: MySlideShow()),
        ],
      )    
    );
  }
}

class MySlideShow extends StatelessWidget {
  const MySlideShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      //upDots: true,
      primaryBullet: 15,
      secondaryBullet: 12,
      primaryColor: Colors.red,
      secondaryColor: Colors.purple,
      slides: [
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ]
    );
  }
}