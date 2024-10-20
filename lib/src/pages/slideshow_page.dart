import 'package:disenos_flutter/src/theme/theme.dart';
import 'package:disenos_flutter/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {

    bool isLarge;
    if (MediaQuery.of(context).size.height > 600) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final children = [
      const Expanded(child: MySlideShow()),
      const Expanded(child: MySlideShow()),
    ];
    return Scaffold(
      body: ( isLarge )      
      ? Column(
          children: children)
      : Row(
          children: children)
    );
  }
}

class MySlideShow extends StatelessWidget {
  const MySlideShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.getCurrenteTheme.colorScheme.primary;

    return Slideshow(
      //upDots: true,
      primaryBullet: 15,
      secondaryBullet: 12,
      primaryColor:  accentColor ,
      //secondaryColor: Colors.purple,
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