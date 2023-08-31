import 'package:flutter/material.dart';
import 'package:tour_guide/models/trip.dart';
import 'package:tour_guide/screens/categories.dart';
import 'package:tour_guide/screens/favorites_screen.dart';
import 'package:tour_guide/widgets/drawer.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({super.key, required this.favoritesTrips});
  @override
  State<TabsScreen> createState() => _TabsScreenState();
  final List<Trip> favoritesTrips;
}

int _selectedIndex = 0;
final List<Widget> _screens = [Categories(), FavoritesScreen()];

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo.png',
              fit: BoxFit.contain,
              height: 70,
            ),
            Text(
              'TOUR GUID',
              style: TextStyle(fontSize: 30, color: Colors.indigo[900]),
            ),
          ],
        ),
      ),
      drawer: DrawerWidget(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Colors.blue[200],
          selectedItemColor: Colors.amber[700],
          unselectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ]),
    );
  }
}
