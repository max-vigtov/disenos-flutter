import 'dart:math';
import 'package:disenos_flutter/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {

  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: [
            const PinterestGrid(),
            _PinteresMenuLocation()
          ],
        ) 
      ),
    );
  }
}

class _PinteresMenuLocation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;    
    final show = Provider.of<_MenuModel>(context).getShow;

    return Positioned(
      bottom: 50,
      child: SizedBox(              
        height: 100,
        width: width,
        child: Align(
          child: PinterestMenu(show: show,),
        )
      )
    );
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({super.key});

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List items = List.generate(200, (i) => i);
  final Random random = Random();
  late List<double> itemHeights; // Lista para almacenar las alturas
  double previousScroll = 0;
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();    
    controller.addListener(() {
      if(controller.offset > previousScroll){
        Provider.of<_MenuModel>(context, listen: false).setShow = false;
      } else{
        Provider.of<_MenuModel>(context, listen: false).setShow = true;
      }
      previousScroll = controller.offset;    
    });
      itemHeights = List.generate(items.length, (index) {
        return random.nextBool() ? 300.0 : 200.0; // Dos tamaños fijos
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverSafeArea(
          sliver: SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverMasonryGrid.count(
              childCount: items.length,
              crossAxisCount: 2,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              itemBuilder: (BuildContext context, int index) {
                final double height = itemHeights[index]; // Usar la altura almacenada
                return PinterestItem(index: index, height: height);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class PinterestItem extends StatelessWidget {

  final int index;
  final double height;
  const PinterestItem({
    super.key, required this.index, required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index', style: const TextStyle(color: Colors.black),),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _show = true;

  bool get getShow => _show;

  set setShow( bool value){
    _show = value;
    notifyListeners();    
  }
  
}