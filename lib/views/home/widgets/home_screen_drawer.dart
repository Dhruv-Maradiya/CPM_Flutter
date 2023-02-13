import 'package:projectify/core/constants/pallets.dart';
import 'package:flutter/material.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Pallets.primaryColor,
            ),
            child: IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.menu),
            ),
          ),
        ],
      ),
    );
  }
}
