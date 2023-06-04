import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_widgets.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar("Sign Up"),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Center(child: reusableText("Enter your details below to sign up successfully")),
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
                      reusableText("Username"),
                      buildTextField('Enter your Username', 'email', "user",
                              (value){
                            //context.read<SignInBloc>().add(EmailEvent(email: value));
                          }
                      ),
                      reusableText("Email"),
                      buildTextField('Enter your Email Address', 'email', "user",
                              (value){
                            //context.read<SignInBloc>().add(EmailEvent(email: value));
                          }
                      ),
                      reusableText("Password"),
                      buildTextField('Enter your Password', 'password', "lock", (value){
                        //context.read<SignInBloc>().add(PasswordEvent(password: value));
                      }),
                      reusableText("Confirm Password"),
                      buildTextField('Enter your Password Again', 'password', "lock", (value){
                        //context.read<SignInBloc>().add(PasswordEvent(password: value));
                      })
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: reusableText("By signing up you are agreeing with our terms and conditions")),
                buildButton("Sign Up", "Login", (){
                  //SignInController(context: context).handleSignIn("email");
                }),

              ],
            ),
          ),
        ),
      ),
    );;
  }
}
