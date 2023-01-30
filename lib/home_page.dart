import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled4/home_page2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top, left: 20, right: 20),
          child: SizedBox(
            height: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset(
                      height: 40,
                      width: 300,
                      fit: BoxFit.cover,
                      'assests/image/ic_project_manager.svg',
                    ),
                  ),
                ),
                Text("Home",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black38),),

                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: SvgPicture.asset(
                    height: 45,
                    width: 45,
                    fit: BoxFit.cover,
                    'assests/image/ic_menu.svg',
                  ),
                ),
              ],
            ),
          ),
        ),
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "All Projects",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20.0),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  fillColor: Colors.blueGrey.withOpacity(0.2),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.blueGrey.withOpacity(0.2),
              padding: EdgeInsets.symmetric(vertical: 20),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  HomePage2()),
                  );

                },
                child: Row(
                  children: [
                    Expanded(child: Image.asset('assests/image/home_img.png')),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\"The Red Bird\"",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.indigo),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "Get Results for Digital Marketing Texas. Find Results from Multipe Sources. Quick Results-Search for Relevant Info & Results. Esy Access Information",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black38),textAlign: TextAlign.left,
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(

              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\"The Red Bird\"",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.indigo),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "Get Results for Digital Marketing Texas. Find Results from Multipe Sources. Quick Results-Search for Relevant Info & Results. Esy Access Information",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black38),textAlign: TextAlign.left,
                          )
                        ],
                      )),
                  Expanded(child: Image.asset('assests/image/home_img.png')),

                ],
              ),
            ),Container(
              color: Colors.blueGrey.withOpacity(0.2),
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  Expanded(child: Image.asset('assests/image/home_img.png')),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\"The Red Bird\"",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.indigo),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "Get Results for Digital Marketing Texas. Find Results from Multipe Sources. Quick Results-Search for Relevant Info & Results. Esy Access Information",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black38),textAlign: TextAlign.left,
                          )
                        ],
                      ))
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
