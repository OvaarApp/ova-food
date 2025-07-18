import 'package:flutter/material.dart';
import 'package:food_app/screens/home_screen.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int currentIndex = 0;
  List<Widget> screens = [HomeScreen(),Home(),Home(),Home()];

  void onTap(int i){
    setState(() {
      currentIndex = i;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex,children: screens,),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
          onTap: onTap,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded),label: 'Profile'),
          ]),
    );
  }
}


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('This is the home screen')
      )
    );
  }
}
