import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../Provider/login_provider.dart';
import 'homescreen.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isvisible = false;
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body:Container(
        width: double.infinity.w,
        height: double.infinity.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.09, 1.00),
            end: Alignment(0.09, -1),
            colors: [
              Colors.black,
              Color(0xFF272C2F),
              Color(0xFF525E64),
              Color(0xFF3B4F58),
              Color(0xFF01293B)
            ],
          ),
        ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 146.h,
                  ),
                  Text(
                    'Welcome ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFF6F6F6),
                      fontSize: 32.sp,
                      fontFamily: 'sfprodisplay',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.80.w,
                    ),
                  ),
                  SizedBox(
                    height: 68.h,
                  ),
                  TextField(
                    cursorColor: Colors.grey,
                    controller: emailController,
                    style: TextStyle(
                        color: Colors.white, decorationThickness: 0.sp),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 25.w),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.18000000715255737),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20.r)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide.none,
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20.r)),
                      hintText: 'Email ID',
                      hintStyle: TextStyle(
                        color: Color(0xFFA7B0BB),
                        fontSize: 16.sp,
                        fontFamily: 'sfprodisplay',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  TextField(
                    obscureText: !isvisible,
                    cursorColor: Colors.grey,
                    controller: passwordController,
                    style: TextStyle(
                        color: Colors.white, decorationThickness: 0.sp),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 20.h, horizontal: 25.w),
                        filled: true,
                        fillColor:
                        Colors.white.withOpacity(0.18000000715255737),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20.r)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide.none,
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(20.r)),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          decoration: TextDecoration.none,
                          color: Color(0xFFA7B0BB),
                          fontSize: 16.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w400,
                        ),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                print(isvisible);
                                isvisible = !isvisible;
                              });
                            },
                            child: isvisible
                                ? Icon(BootstrapIcons.eye,
                                color: Color(0xFFA7B0BB))
                                : Icon(
                              BootstrapIcons.eye_slash,
                              color: Color(0xFFA7B0BB),
                            ))),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  if (authProvider.errorMessage != null)
                          Text(
                            authProvider.errorMessage!,
                            style: TextStyle(color: Colors.red),
                          ),
                  SizedBox(
                    height: 88.h,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await authProvider.login(
                        emailController.text,
                        passwordController.text,
                      );
                      if (authProvider.user != null) {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                            builder: (context) => const HomeScreen()), (
                            route) => false);
                      }
                    },
                    child: Container(
                      width: 350.w,
                      height: 73.h,
                      decoration: ShapeDecoration(
                       // color: Color(0xFFDDE0E3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Color(0xFF01293B),
                            fontSize: 20.sp,
                            fontFamily: 'sfprodisplay',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.20.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
