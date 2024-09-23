import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: PinterestGrid(),
      ) 
    );
  }
}

class PinterestGrid extends StatelessWidget {

  final List items = List.generate(200, (i) => i);

   PinterestGrid({
    super.key,
  });

  @override
Widget build(BuildContext context) {
  return StaggeredGrid.count(
    crossAxisCount: 4,  // Número de columnas
    mainAxisSpacing: 4.0,
    crossAxisSpacing: 4.0,    
    children: List.generate(items.length, (index) {    
      return StaggeredGridTile.count(        
        crossAxisCellCount: 2,
        mainAxisCellCount: index.isEven ? 2 : 3,  // Ajusta el tamaño de los tiles
        child: PinterestItem(index: index,),
      );
    }),
    );    
  }
}

class PinterestItem extends StatelessWidget {

  final int index;
  const PinterestItem({
    super.key, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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

class Tile extends StatelessWidget {
  final int index;
  const Tile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}