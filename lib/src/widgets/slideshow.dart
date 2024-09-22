import 'package:disenos_flutter/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {

  final List<Widget> slides;

  const Slideshow({super.key, required this.slides});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SliderModel(),
      child:  Center(
          child: Column(
            children: [
              Expanded(
                child: _Slides(slides)),
               _Dots(slides.length)
            ],
          )
        ),
    );
  }
}


class _Dots extends StatelessWidget {
  final int totalSlides;
  const _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(        
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (index) => _Dot(index))
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {

    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
          ? Colors.blue
          : Colors.grey,
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
        Provider.of<SliderModel>(context, listen: false).setCurrentPage = pageViewController.page!;
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