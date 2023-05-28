import 'package:e_learning_app/pages/sign_in/widgets/signin_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLogin(),
                Center(child: reusableText("Or you can login through your email account")),
                Container(padding: EdgeInsets.symmetric(horizontal: 25.w),child: Divider()),
                Container(
                  margin: EdgeInsets.only(
                    top: 30.h,
                  ),
                  padding: EdgeInsets.only(
                    left: 25.w,
                    right: 25.w
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("Email"),
                      SizedBox(height: 5.h),
                      buildTextField('Enter your Email Address', 'email', "user"),
                      reusableText("Password"),
                      SizedBox(height: 5.h),
                      buildTextField('Enter your Password', 'password', "lock")
                    ],
                  ),
                ),
                forgotPassword(),
                buildButton("Sign In", "Login"),
                buildButton("Register Now", "Register"),
              ],
            ),
          ),
        ),
      ),
    ) ;
  }
}
