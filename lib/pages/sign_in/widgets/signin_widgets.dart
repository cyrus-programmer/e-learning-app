import 'package:e_learning_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Creating AppBar here so that we can modify it.
AppBar buildAppBar() {
  return AppBar(
    title: Center(
      child: Text("Login",
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.primaryText)),
    ),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1.0,
      ),
    ),
  );
}

//we need context for bloc
Widget buildThirdPartyLogin() {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    padding: EdgeInsets.symmetric(horizontal: 35.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcons("google"),
        _reusableIcons("apple"),
        _reusableIcons("facebook"),
      ],
    ),
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(text,
        style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey.withOpacity(0.8),
            fontWeight: FontWeight.normal)),
  );
}

Widget buildTextField(String text, String textType, String iconName) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.primaryFourElementText)),
    child: Center(
      child: Row(
        children: [
          Container(
            width: 16.w,
            height: 16.w,
            margin: EdgeInsets.only(left: 17.w),
            child: Image.asset('assets/icons/$iconName.png'),
          ),
          Container(
            margin: EdgeInsets.only(top: 6.h, left: 5.w),
            width: 270.w,
            height: 50.h,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: AppColors.primarySecondaryElementText),
                  hintText: text,
                  border: InputBorder.none),
              style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryText),
              autocorrect: false,
              obscureText: textType == 'password' ? true : false,
            ),
          )
        ],
      ),
    ),
  );
}

Widget forgotPassword() {
  return Container(
    margin: EdgeInsets.only(left: 25.h),
    width: 260.w,
    height: 44.h,
    child: Text("Forgot Password?",
        style: TextStyle(
          color: AppColors.primaryText,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryText,
            fontSize: 12.sp)),
  );
}

Widget buildButton(String btnName, String btnType) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(
        left: 25.w, right: 25.w, top: btnType == "Login" ? 20.h : 20.h),
    decoration: BoxDecoration(
        color: btnType == "Login"
            ? AppColors.primaryElement
            : AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(
            color: btnType == "Login"
                ? Colors.transparent
                : AppColors.primaryElement),
        boxShadow: [
          BoxShadow(
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
              color: Colors.grey.withOpacity(0.2))
        ]),
    child: Center(
        child: Text(btnName,
            style: TextStyle(
                fontSize: 16.sp,
                color: btnType == "Login"
                    ? AppColors.primaryBackground
                    : AppColors.primaryElement,
                fontWeight: FontWeight.normal))),
  );
}
