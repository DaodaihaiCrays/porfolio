import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/nav_items.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key, required this.scaffoldKey, required this.onNavItemTap});
  final Function(int) onNavItemTap;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColor.scaffoldBg,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                scaffoldKey.currentState?.closeEndDrawer();
              },
              icon: Icon(Icons.close, color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
          for (int i = 0; i < navItems.length; i++)
            ListTile(
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
              onTap: () {
                onNavItemTap(i);
              },
              leading: Icon(navIcons[i], color: Colors.white),
              title: Text(navItems[i], style: TextStyle(color: Colors.white)),
            ),
        ],
      ),
    );
  }
}
