 
import 'package:flutter/material.dart';
 
import 'package:project_it/screens/logout.dart';
import 'package:project_it/screens/menu_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key, required this.page});
  int page;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // int currentpage = 0;

  List<Widget> screens = [
    const MenuScreen(),
    const LogoutScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[widget.page],
      bottomNavigationBar: BottomNavigationBar(
       
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.page,
        selectedItemColor: const Color(0xff1356B8),
        onTap: (i) async {
          if (i == 2) {
            
          } else {
            widget.page = i;
            setState(() {});
          }
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
