import 'package:disenos_flutter/src/theme/theme.dart';
import 'package:disenos_flutter/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CircularGraphicsPage extends StatefulWidget {
  const CircularGraphicsPage({super.key});

  @override
  State<CircularGraphicsPage> createState() => _CircularGraphicsPageState();
}

class _CircularGraphicsPageState extends State<CircularGraphicsPage> {

  double percentage = 0.0;

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      floatingActionButton: FloatingActionButton(
       // backgroundColor: accentColor,
        onPressed: (){
          setState(() {
            percentage += 10;
            
            if(percentage > 100){
              percentage = 0;
            }
          });
        },
        child: const Icon(Icons.refresh)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CustomRadialProgress(percentage: percentage, color: Colors.blue,),
                CustomRadialProgress(percentage: percentage * 1.2, color: Colors.red,)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CustomRadialProgress(percentage: percentage * 1.4, color: Colors.pink,),
                CustomRadialProgress(percentage: percentage * 1.6, color: Colors.purple,)
              ],
            )            
          ],
        )
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  const CustomRadialProgress({
    super.key,
    required this.percentage, 
    required this.color,
  });

  final double percentage;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).getCurrenteTheme;

    return SizedBox(
      width: 200,
      height: 200,
      child: RadialProgress(
        percentage: percentage, 
        primaryColor: color,
        secondaryColor: appTheme.textTheme.bodyLarge!.color!,
      ),
    );
  }
}