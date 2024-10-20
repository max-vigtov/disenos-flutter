import 'package:disenos_flutter/src/routes/routes.dart';
import 'package:disenos_flutter/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).getCurrenteTheme;

    return Scaffold(      
      appBar: AppBar(
        title: const Text('Diseños de flutter - Teléfono'),
        elevation: 5,
        backgroundColor: appTheme.appBarTheme.backgroundColor,
      ),
      body: const _OptionsList(),
      drawer: _MainMenu(),
    );
  }
}

class _OptionsList extends StatelessWidget {
  const _OptionsList();

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.getCurrenteTheme.colorScheme.primary;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder:(context, index) =>       
       Divider(
        color: accentColor,
      ),
      itemCount: pageRoutes.length,
      itemBuilder:(context, index) => 
       ListTile(
        leading: FaIcon( pageRoutes[index].icon, color: accentColor ),
        title:  Text( pageRoutes[index].title) ,
        trailing: Icon( Icons.chevron_right, color: accentColor ),
        onTap: () => Navigator.push( context, MaterialPageRoute(
          builder:(context) => pageRoutes[index].page))
      ),
    );
  }
}

class _MainMenu extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.getCurrenteTheme.colorScheme.primary;

    return Drawer(      
      child: Column(
        children: [
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundColor: accentColor,
                child: const Text('MV', style: TextStyle( fontSize: 50, color: Colors.white),),
              ),
            ),
          ),
          const Expanded(
            child: _OptionsList()
          ),
      
          ListTile(
            leading: Icon( Icons.lightbulb_outlined, color: accentColor),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
              value: appTheme.getDarkTheme, 
              activeColor: accentColor,
              onChanged: ( value ) => appTheme.setDarkTheme = value
            ),
          ),
      
          SafeArea(
            bottom: true,
            top: false,
            left: false,
            right: false,
            child: ListTile(
              leading: Icon( Icons.add_to_home_screen, color: accentColor),
              title: const Text('Custom Theme'),
              trailing: Switch.adaptive(
                value: appTheme.getCustomTheme, 
                activeColor: accentColor,
                onChanged: ( value ) => appTheme.setCustomTheme = value
              ),
            ),
          ) 
        ],
      ),
    );
  }
}