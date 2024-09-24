import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {

  final List<PinterestButton> items;
  final Color backgroundColor;
  final Color inactiveColor;
  final Color activeColor;
  final bool show;

   const PinterestMenu({
    super.key,
    this.show = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.blueGrey,
    required this.items
   });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>  _MenuModel(),
      child: AnimatedOpacity(
        duration: const Duration( milliseconds: 250),
        opacity: ( show ) ? 1 : 0,        
        child: Builder(
          builder: (BuildContext context) {
          Provider.of<_MenuModel>(context).setBackgroundColor = backgroundColor;
          Provider.of<_MenuModel>(context).setActiveColor = activeColor;
          Provider.of<_MenuModel>(context).setInactiveColor = inactiveColor;

            return _PinterestMenuBackground(
              child: _MenuItems(
                menuItems: items
              )
            );
          },         
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  
  final Widget child;
  
  const _PinterestMenuBackground({ required this.child});

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Provider.of<_MenuModel>(context).getBackgroundColor;
    return Container(
      width: 250,
      height: 60,
      decoration:  BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        boxShadow: const <BoxShadow> [
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

  const _PinterestMenuButton({ 
    required this.index, 
    required this.item
  });

  @override
  Widget build(BuildContext context) {

    final selectedItem = Provider.of<_MenuModel>(context).getSelectedItem;
    final menuModel = Provider.of<_MenuModel>(context);


     return IconButton(
      onPressed: (){
        Provider.of<_MenuModel>(context, listen: false).setSelectedItem = index;
        item.onPressed();
      },
      icon: Icon(
        item.icon, 
        color: (selectedItem == index) ? menuModel.getActiveColor : menuModel.getInactiveColor,
        size: (selectedItem == index) ? 30 : 25,
      ),
    );
    // return GestureDetector(
    //   onTap: item.onPressed(),
    //   behavior: HitTestBehavior.translucent,
     
   // );
  }
}


class _MenuModel with ChangeNotifier{
  int _selectedItem = 0;
  Color _backgroundColor = Colors.white;
  Color _activeColor = Colors.black;
  Color _inactiveColor = Colors.blueGrey;

  int get getSelectedItem => _selectedItem;
  set setSelectedItem (int index){
    _selectedItem = index;
    notifyListeners();
  }

  Color get getBackgroundColor => _backgroundColor;
  set setBackgroundColor(Color backgroundColor) {
    _backgroundColor = backgroundColor;
  }

  Color get getActiveColor => _activeColor;
  set setActiveColor(Color activeColor) {
    _activeColor = activeColor;
  }

  Color get getInactiveColor => _inactiveColor;
  set setInactiveColor(Color inactiveColor) {
    _inactiveColor = inactiveColor;
  }  

}