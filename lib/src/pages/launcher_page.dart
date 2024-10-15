import 'package:disenos_flutter/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Diseños de flutter', style: TextStyle( color: Colors.white),),
        elevation: 5,
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
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder:(context, index) => 
      const Divider(
        color: Colors.blue,
      ),
      itemCount: pageRoutes.length,
      itemBuilder:(context, index) => 
       ListTile(
        leading:  FaIcon( pageRoutes[index].icon, color: Colors.blue ),
        title:  Text( pageRoutes[index].title) ,
        trailing: const Icon( Icons.chevron_right, color: Colors.blue ),
        onTap: () => Navigator.push( context, 
          MaterialPageRoute(builder:(context) => pageRoutes[index].page,))
      ),
    );
  }
}

class _MainMenu extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 200,
              child: const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('MV', style: TextStyle( fontSize: 50),),
              ),
            ),
          ),
          const Expanded(
            child: _OptionsList()
          ),
      
          ListTile(
            leading:  const Icon( Icons.lightbulb_outlined, color: Colors.blue),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
              value: true, 
              activeColor: Colors.blue,
              onChanged: ( value ) { } ),
          ),
      
          SafeArea(
            bottom: true,
            top: false,
            left: false,
            right: false,
            child: ListTile(
              leading:  const Icon( Icons.add_to_home_screen, color: Colors.blue),
              title: const Text('Custom Theme'),
              trailing: Switch.adaptive(
                value: true, 
                activeColor: Colors.blue,
                onChanged: ( value ) { } ),
            ),
          ) 
        ],
      ),
    );
  }
}