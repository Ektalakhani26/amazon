

import 'package:amazon/Pages/HomeScreen.dart';
import 'package:amazon/Pages/YouScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Pages/CartScreen.dart';
import '../Pages/MenuScreen.dart';

class MyFun {
  static int selectedIndex = 0; // Move selectedIndex outside the function

  static BottomNavigationBar bottomNavigation(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.tealAccent.shade700,
      currentIndex: selectedIndex,
      selectedLabelStyle: TextStyle(color: Colors.orange), // Set selected label color
      unselectedLabelStyle: TextStyle(color: Colors.white),
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.orange,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: selectedIndex == 0 ? Colors.orange : Colors.white),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu, color: selectedIndex == 1 ? Colors.orange : Colors.white),
          label: 'Menu',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_shopping_cart, color: selectedIndex == 2 ? Colors.orange : Colors.white),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle_outlined, color: selectedIndex == 3 ? Colors.orange : Colors.white),
          label: 'You',
        ),
      ],
      onTap: (value) {
        selectedIndex = value; // Update selectedIndex when an item is tapped
        print(value);
        if (value == 0)
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
        else if (value == 1)
          Navigator.push(context, MaterialPageRoute(builder: (context) => MenuScreen(),));
        else if (value == 2)
          Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
        else if (value == 3)
          Navigator.push(context, MaterialPageRoute(builder: (context) => YouScreen(),));
      },
    );
  }
}