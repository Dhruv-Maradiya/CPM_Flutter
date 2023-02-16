import 'package:projectify/core/constants/pallets.dart';
import 'package:flutter/material.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.65,
      child: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 5,
            ),
            ListTile(
              leading: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Scaffold.of(context).closeDrawer();
                    },
                    child: Image.asset(
                      'assets/images/menu_icon.png',
                      height: 30,
                      width: 30,

                    ),
                  ),

                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              leading: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Pallets.secondaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/projects_4.png',
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              title: const Text(
                'Projects',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Pallets.primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Pallets.secondaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/group_icon.png',
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              title: const Text(
                'Groups',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Pallets.primaryColor,
                ),
              ),
            ),
            // Students

            SizedBox(
              height: 12,
            ),
            ListTile(
              leading: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Pallets.secondaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/student_icon.png',
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              title: const Text(
                'Students',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Pallets.primaryColor,
                ),
              ),
            ),
            // Faculties
            SizedBox(
              height: 12,
            ),
            ListTile(
              leading: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Pallets.secondaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/faculty_icon.png',
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              title: const Text(
                'Faculties',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Pallets.primaryColor,
                ),
              ),
            ),
            // Branches
            SizedBox(
              height: 12,
            ),
            ListTile(
              leading: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Pallets.secondaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/branch_icon.png',
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              title: const Text(
                'Branches',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Pallets.primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            ListTile(
              leading: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Pallets.secondaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/academic_icon.png',
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              title: const Text(
                'Academics',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Pallets.primaryColor,
                ),
              ),
            ), //
            SizedBox(
              height: 12,
            ),
            ListTile(
              leading: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Pallets.secondaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/technology_icon.png',
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              title: const Text(
                'Technologies',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Pallets.primaryColor,
                ),
              ),
            ),
            // Academics
            // Categories
          ],
        ),
      ),
    );
  }
}
