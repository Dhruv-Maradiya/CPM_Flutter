import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled4/app_colors.dart';
import 'package:untitled4/app_images.dart';
import 'package:untitled4/loginpage.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [SizedBox(height: 14,),
          Positioned(
            child: Image.asset(AppImages.projectTraiangle),
            bottom: 0,
            right: 0,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
SizedBox(height: 35,),
                       SizedBox(height: 18,),
            Padding(
              padding: const EdgeInsets.only(left:8),
              child: Image.asset(AppImages.welcomeicon),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Image.asset(AppImages.welcomeicon2),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                'Submit Productive Project, Right Now.',
                style: TextStyle(
                    color: AppColors.colorBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),SizedBox(height: 6,),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                  'Create,  Submit and keep track of\nyour project easily and effectively.',
                  style: TextStyle(
                      color: AppColors.colorBlack.withOpacity(0.55),
                      fontSize: 16)),
            ),
            //Image.asset(AppImages.projectioc,),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 30, top: 10),
                  child: GestureDetector(onTap: (){
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                    child: SvgPicture.asset(
                      AppImages.icbackicon,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    ));
  }
}
