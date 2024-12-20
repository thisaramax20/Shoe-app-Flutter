import 'package:flutter/material.dart';
import 'package:shoe_app/components/my_nav_bar.dart';
import 'package:shoe_app/pages/cart.dart';
import 'package:shoe_app/pages/shop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //this selected index is to control the bottom navbar
  int _selectedTab = 0;

  //this method will update the selected index when the user tap on the nav
  void navigateBottomBar(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  final List<Widget> _pages = [const Shop(), const Cart()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavBar(
        onTabChange: (value) {
          navigateBottomBar(value);
        },
      ),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ));
        }),
      ),
      drawer: const Drawer(),
      body: _pages[_selectedTab],
    );
  }
}
