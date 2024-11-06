import 'package:flutter/material.dart';
import 'package:providerapi/Ui/homescreen.dart';
import 'package:providerapi/Ui/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if(prefs.containsKey("token")){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>HomeScreen()),(route)=> false);
      }else{
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>LoginScreen()),(route)=> false);
      }
    });
    return Scaffold(
      backgroundColor: Colors.black,
    );
  }
}
