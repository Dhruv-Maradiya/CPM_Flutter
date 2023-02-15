import 'package:projectify/core/constants/pallets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(child:ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
SizedBox(height: 50,),
        ListTile(
    title: Text('Projects',style: TextStyle(fontWeight:FontWeight.bold,color:Colors.indigo),),

        ),
        ListTile(
          title: Text('Group',style: TextStyle(fontWeight:FontWeight.bold,color:Colors.indigo),),

        ), ListTile(
    title: Text('Students',style: TextStyle(fontWeight:FontWeight.bold,color:Colors.indigo),),

    ), ListTile(
    title: Text('Faculties',style: TextStyle(fontWeight:FontWeight.bold,color:Colors.indigo),),

    ), ListTile(
    title: Text('Branches',style: TextStyle(fontWeight:FontWeight.bold,color:Colors.indigo),),
    ),ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Text('List 1'),
          Text('List 2'),
          Text('List 3'),
        ],
      ), ListTile(
    title: Text('Technolgies',style: TextStyle(fontWeight:FontWeight.bold,color:Colors.indigo),),


    ), ListTile(
    title: Text('Academics',style: TextStyle(fontWeight:FontWeight.bold,color:Colors.indigo),),

    ),


      ]));


  }
  }