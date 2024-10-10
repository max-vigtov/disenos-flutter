import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            left: 40,
            top: 850,
            child: _ButtonNewList()
          )
        ],
      )
    );
  }
}

class _ButtonNewList extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 00,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:const Color(0xffED6762),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
          )
        ),
        child: const Text('CREATE NEW LIST',
          style: TextStyle( 
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3
          ),
        ),
        onPressed: () { },
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {

    final items = [
    const _ListItem( 'Orange', Color(0xffF08F66) ),
    const _ListItem( 'Family', Color(0xffF2A38A) ),
    const _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    const _ListItem( 'Books', Color(0xffFCEBAF) ),
    const _ListItem( 'Orange', Color(0xffF08F66) ),
    const _ListItem( 'Family', Color(0xffF2A38A) ),
    const _ListItem( 'Subscriptions',  Color(0xffF7CDD5) ),
    const _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minHeight: 204, 
            maxHeight: 250,
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: const _Title())
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed( 
            [
              ...items, 
              const SizedBox( height: 100,)
            ]
          ))
      ]
    );
  }
}

class _SliverCustomHeaderDelegate  extends SliverPersistentHeaderDelegate{
  
  final double minHeight;
  final double maxHeight;
  final Widget child;
  
  _SliverCustomHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child
  });
  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand( child: child );
  }

  @override
  double get maxExtent => ( minHeight > maxHeight ) ? minHeight : maxHeight;

  @override
  double get minExtent => ( minHeight < maxHeight ) ? minHeight : maxHeight;

  @override
  bool shouldRebuild( _SliverCustomHeaderDelegate oldDelegate) {  
    return maxHeight != oldDelegate.maxHeight ||
           minHeight != oldDelegate.minHeight || 
           child != oldDelegate.child;
  }

}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),        
        
        Container(
          margin: const EdgeInsets.symmetric( horizontal: 30, vertical: 0),
          child: const Text("New", style: TextStyle(color: Color(0xff532128), fontSize: 50),),
        ),

        Stack(
          children: [        
            const SizedBox(width: 10,),        
            Positioned(
              bottom: 8,
              child: Container(
                width: 120,
                height: 8,
                decoration: BoxDecoration(
                  color: const Color(0xffF7CDD5),
                  borderRadius: BorderRadius.circular(10)
                ),              
              ),
            ),
            const Text('List', style: TextStyle( color:  Color(0xffd93a30), fontSize: 50, fontWeight: FontWeight.bold),),
          ],
        )  
      ],
    );
  }
}



class _TaskList extends StatelessWidget {
  
    final items = [
    const _ListItem( 'Orange', Color(0xffF08F66) ),
    const _ListItem( 'Family', Color(0xffF2A38A) ),
    const _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    const _ListItem( 'Books', Color(0xffFCEBAF) ),
    const _ListItem( 'Orange', Color(0xffF08F66) ),
    const _ListItem( 'Family', Color(0xffF2A38A) ),
    const _ListItem( 'Subscriptions',  Color(0xffF7CDD5) ),
    const _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) => items[index]
    );
  }
}

class _ListItem extends StatelessWidget {

  final String title;
  final Color color;

  const _ListItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,      
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      child:  Text(title, style: const TextStyle( color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),

    );
  }
}