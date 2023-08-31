import 'package:flutter/material.dart';
import 'package:tour_guide/screens/filter_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.amberAccent[400],
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.playlist_add_circle_rounded, color: Colors.black,),
                  Text('Menu', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),),
                ],
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child:
                ElevatedButton(onPressed:(){Navigator.of(context).pushReplacementNamed('/');}, child: Row(
              children: [
                  Icon(Icons.home, color: Colors.black,),
                  Text(' Home', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black),),
              ],
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                ElevatedButton(onPressed:(){Navigator.of(context).pushReplacementNamed(FilterScreen.filterRoute);}, child: Row(
              children: [
                Icon(Icons.search, color: Colors.black,),
                Text(' Filter Search', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black), ),
              ],
              )
            ),
          )

        ],
      ),
    );
  }
}