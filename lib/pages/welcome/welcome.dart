import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_learning_app/common/values/colors.dart';
import 'package:e_learning_app/pages/welcome/bloc/welcome_events.dart';
import 'package:e_learning_app/pages/welcome/bloc/welcome_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/welcome_bloc.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(body:
          BlocBuilder<WelComeBlocs, WelcomeState>(builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(top: 34.h),
          width: 375.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                onPageChanged: (value) {
                  state.page = value;
                  BlocProvider.of<WelComeBlocs>(context).add(WelComeEvents());
                },
                controller: pageController,
                children: [
                  _page(
                      1,
                      context,
                      "Next",
                      "First See Learning",
                      "Forget a for of paper all knowledge in one learning",
                      "assets/images/reading.png"),
                  _page(
                      2,
                      context,
                      "Next",
                      "Connect With Everyone",
                      "Always keep in touch with your tutor & friends. Lets get connected!",
                      "assets/images/boy.png"),
                  _page(
                      3,
                      context,
                      "Get Started",
                      "Always Fascinated Learning",
                      "Anywhere, anytime, the time is at your discretion so study whenever you want.",
                      "assets/images/man.png")
                ],
              ),
              Positioned(
                  bottom: 60.h,
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: state.page,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                        color: AppColors.primaryThreeElementText,
                        activeColor: AppColors.primaryElement,
                        size: Size.square(8),
                        activeSize: Size(15, 8),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ))
            ],
          ),
        );
      })),
    );
  }

  Widget _page(int index, BuildContext context, String btnName, String title,
      String subtitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.h,
          child: Image.asset(imagePath, fit: BoxFit.cover,),
        ),
        Text(title,
            style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal)),
        SizedBox(height: 20.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          width: 375.w,
          child: Text(subtitle,
              style: TextStyle(
                  color: AppColors.primarySecondaryElementText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal)),
        ),
        GestureDetector(
          onTap: (){
            if(index<3){
              pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.linear);
            }else{
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
              Navigator.of(context).pushNamedAndRemoveUntil('signIn', (route) => false );
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 24.w, right: 24.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(15.w),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1)),
                ]),
            child: Center(
              child: Text(btnName,
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.normal)),
            ),
          ),
        )
      ],
    );
  }
}
