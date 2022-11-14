import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: const [
      SizedBox(
        height: 128,
        child: DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF003865),
            ),
            child: Text('Drawer Header')),
      ),
      ListTile(title: Text('Item 1'))
    ]));
  }
}
