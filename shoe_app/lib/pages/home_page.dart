import 'package:flutter/material.dart';
import 'package:shoe_app/components/my_nav_bar.dart';
import 'package:shoe_app/pages/cart_page.dart';
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

  final List<Widget> _pages = [const Shop(), const CartPage()];

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
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(child: Image.asset('lib/images/nikelog.jpg')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    color: Colors.grey[700],
                  ),
                ),

                //list of menu
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      "H O M E",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    title: Text(
                      "A B O U T",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25, bottom: 15),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  "L O G O U T",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      body: _pages[_selectedTab],
    );
  }
}
