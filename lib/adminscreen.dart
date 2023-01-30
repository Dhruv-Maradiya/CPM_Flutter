import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled4/app_colors.dart';
import 'package:untitled4/app_images.dart';
import 'package:untitled4/app_strings.dart';


class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: Drawer(
         child: ListView(
           padding: EdgeInsets.zero,
           children: [
             const DrawerHeader(decoration: BoxDecoration(
               color: AppColors.color3C19A1,
             ),
               child: Text('Project manager',textAlign: TextAlign.center,style: TextStyle(color: AppColors.colorFFFFFF,fontWeight: FontWeight.bold),
               ),


               

             )
           ],
         ),
       ),
        appBar: AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: AppColors.color2B23B7.withOpacity(0.07),
      title: Text(AppString.admin,style: TextStyle(color:AppColors.color3C19A1,fontWeight: FontWeight.bold)),
      actions: [
        GestureDetector(

          child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.colorFFFFFF),
          ))
      ],
    ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                child  : Text(AppString.allProject,
                      style: TextStyle(
                          color: AppColors.colorBlack,
                          fontWeight: FontWeight.bold)),
                                   ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                  prefixIconConstraints:
                  BoxConstraints(maxHeight: 20, maxWidth: 28),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.color3C19A1,
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey)),
                  hintText: "Search",
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (content, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    color: AppColors.colorF6F6F9,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(AppImages.icwebdevelop,
                              width: double.infinity, fit: BoxFit.cover),
                          Row(
                            children: [
                              Image.asset(AppImages.icUserCircle),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppString.admin,
                                    style: TextStyle(
                                        color: AppColors.colorBlack,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Patel Harsh",
                                    style: TextStyle(
                                        color: AppColors.color3231C3),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Text(
                            AppString.webdesignforfree,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.color3231C3),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppString.getresults,
                            style: TextStyle(
                                color:
                                AppColors.colorBlack.withOpacity(0.63)),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: 5,
            ),
          )
        ]));
  }
}

