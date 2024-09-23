import 'package:flutter/material.dart';

class PinterestButton {
  final VoidCallback onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {

  final List<PinterestButton> items = [
    PinterestButton(onPressed: () { print('icon pie_char');}, icon: Icons.pie_chart),
    PinterestButton(onPressed: () { print('icon search');}, icon: Icons.search),
    PinterestButton(onPressed: () { print('icon notifications');}, icon: Icons.notifications),
    PinterestButton(onPressed: () { print('icon supervised_user_circle');}, icon: Icons.supervised_user_circle),
  ];

   PinterestMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: _PinterestMenuBackground(child: _MenuItems(menuItems: items)
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  
  final Widget child;
  
  const _PinterestMenuBackground({ required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5
          )
        ]
      ),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {

  final List<PinterestButton> menuItems;
  
  const _MenuItems({required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (i) => _PinterestMenuButton(index: i, item: menuItems[i]))
    );
  }
}


class _PinterestMenuButton extends StatelessWidget {

  final int index;
  final PinterestButton item;

  const _PinterestMenuButton({ required this.index, required this.item});

  @override
  Widget build(BuildContext context) {
     return IconButton(
      onPressed: item.onPressed,
        icon: Icon(
          item.icon, 
          color: Colors.blueGrey,
          size: 25,
        ),
      );
    // return GestureDetector(
    //   onTap: item.onPressed(),
    //   behavior: HitTestBehavior.translucent,
     
   // );
  }
}