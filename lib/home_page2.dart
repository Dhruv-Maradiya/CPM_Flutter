import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled4/app_colors.dart';
import 'package:untitled4/app_images.dart';
import 'package:untitled4/app_strings.dart';
import 'package:untitled4/tablescreen.dart';

import 'loginpage.dart';

class HomePage2 extends StatefulWidget {
  HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int _selectedIndex = 0;

  List<String> imagesList = [
    AppImages.icoldcar,
    AppImages.icmustang,
    AppImages.icporsche,
    AppImages.iccadi
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    {
      return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.color3C19A1,
            child: Icon(Icons.home),
            onPressed: () {},
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child:Image.asset(AppImages.ichomeicon
                    ,height: 30,
                    width: 30,
                  ),
                ),
                Expanded(
                  child: Image.asset(AppImages.icstudenticon
                    ,height: 30,
                    width: 30,

                  ),
                ),
                Expanded(child: new Text('')),
                Expanded(
                  child: Image.asset(AppImages.icgroupicon
                    ,height: 30,
                    width: 30,
                                    ),
                ),
                Expanded(
                  child:  Image.asset(AppImages.icfacultyicon,
                    height: 30,
                    width: 30,

                  ),
                ),
              ],
            ),
          ),
          drawer: Drawer(),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: AppColors.color2B23B7.withOpacity(0.07),
            title: Image.asset(AppImages.projectmanager),
            actions: [
              GestureDetector(
                onTap: () {
                  showMyDialog(context);
                },
                child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.color3C19A1),
                    child: Image.asset(AppImages.userIcon)),
              )
            ],
          ),
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Text(AppString.allProject,
                    style: TextStyle(
                        color: AppColors.colorBlack,
                        fontWeight: FontWeight.bold)),
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
                            CarouselSlider(
                              items: imagesList.map((image) {
                                return Container(
                                  margin: EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: AssetImage(image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }).toList(),
                              options: CarouselOptions(
                                  onPageChanged: (i, a) {
                                    _current = i;
                                    setState(() {});
                                  },
                                  autoPlay: true,
                                  reverse: true,
                                  enlargeCenterPage: true,
                                  viewportFraction: 0.8,
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 100)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: imagesList.map(
                                (image) {
                                  int index = imagesList.indexOf(image);
                                  return Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 2.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _current == index
                                            ? Color.fromRGBO(0, 0, 0, 0.9)
                                            : Color.fromRGBO(0, 0, 0, 0.4)),
                                  );
                                },
                              ).toList(), // this was the part the I had to add
                            ),
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

  void showMyDialog(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Wrap(
              children: [
                Material(
                  color: Colors.transparent,
                  child: Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),

                          width: MediaQuery.of(context).size.width - 40,
//                  height: MediaQuery.of(context).size.height -  10
                          padding: EdgeInsets.only(
                              top: 20, bottom: 10, left: 15, right: 15),
//                      color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 25,
                                ),
                                Text(AppString.Group,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26,
                                        color: AppColors.color3231C3)),
                                Text(AppString.admin,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.colorBlack
                                            .withOpacity(0.53))),
                                RaisedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TableScreen(),
                                      ),
                                    );
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(AppString.login,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.colorFFFFFF)),
                                  ),
                                  color: AppColors.color3231C3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          left: 0,
                          top: -20,
                          child: Center(
                            child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.color3C19A1),
                                child: Image.asset(
                                  AppImages.userIcon,
                                  height: 25,
                                  width: 25,
                                  fit: BoxFit.contain,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
