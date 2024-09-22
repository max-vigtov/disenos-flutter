import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {

  final List<Widget> slides;
  final bool upDots;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;
  
  const Slideshow({
    super.key, 
    required this.slides, 
    this.upDots = false,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey, 
    this.primaryBullet  = 12.0,
    this.secondaryBullet = 12.0
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideShowModel(),
      child: SafeArea(
        child: Center(
            child: Builder(
              builder:(context) {            
                Provider.of<_SlideShowModel>(context).setPrimaryColor = primaryColor;
                Provider.of<_SlideShowModel>(context).setSecondaryColor = secondaryColor;
              return StructureSlideShow(upDots: upDots, slides: slides);
              }
            )
        ),
      ),
    );
  }
}

class StructureSlideShow extends StatelessWidget {
  const StructureSlideShow({
    super.key,
    required this.upDots,
    required this.slides,
  });

  final bool upDots;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if ( upDots ) _Dots(slides.length),
    
        Expanded(child: _Slides(slides)),
    
        if ( !upDots ) _Dots(slides.length),
    
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  
  final int totalSlides;

  const _Dots(
    this.totalSlides, 

  );

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(        
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (index) => _Dot(index,))
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;

  const _Dot(this.index, );

  @override
  Widget build(BuildContext context) {

    final slideShowModel = Provider.of<_SlideShowModel>(context);
    double size = 0;
    Color color;

    if (slideShowModel.currentPage  >= index - 0.5 && slideShowModel.currentPage < index + 0.5){ 
      size = slideShowModel.primaryBullet;
      color = slideShowModel.primaryColor;
    
    } else {
      size = slideShowModel.secondaryBullet;
      color = slideShowModel.secondaryColor;
      
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: size,
      height: size,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  final pageViewController = PageController();

  @override
  void initState() {    
    super.initState();
    pageViewController.addListener(() {
        //update provider, slidermodel
        Provider.of<_SlideShowModel>(context, listen: false).setCurrentPage = pageViewController.page!;
     });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      // children: const [
      //   _Slide('assets/svgs/slide-1.svg'),
      //   _Slide('assets/svgs/slide-2.svg'),
      //   _Slide('assets/svgs/slide-3.svg'),               
      // ],
      children: widget.slides.map( (slide) => _Slide(slide) ).toList(),
    );
  }
}

class _Slide extends StatelessWidget {

  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide
    );
  }
}

class _SlideShowModel with ChangeNotifier{
  
  double _currentPage = 0;

  Color _primaryColor =  Colors.blue;
  Color _secondaryColor = Colors.grey;
  double _primaryBullet = 12;
  double _secondaryBullet = 12;

  double get currentPage => _currentPage;
  set setCurrentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  Color get primaryColor => _primaryColor;
  set setPrimaryColor(Color primaryColor) {
    _primaryColor = primaryColor;
  }

  Color get secondaryColor => _secondaryColor; 
  set setSecondaryColor(Color secondaryColor) {
    _secondaryColor = secondaryColor;
  }

  double get primaryBullet => _primaryBullet;
  set setPrimaryBullet(double size) {
    _primaryBullet = size;
  }

  double get secondaryBullet => _secondaryBullet;
  set setSecondaryBullet(double size) {
    _secondaryBullet = size;
  }
}