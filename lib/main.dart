import 'package:flutter/material.dart';
import 'package:flutter_developer_task/auth_screen.dart';
import 'package:flutter_developer_task/custom_bottom_navigation.dart';
import 'package:flutter_developer_task/home_screen.dart';
import 'package:flutter_developer_task/next_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      theme: ThemeData(accentColor: Colors.blue,primaryColor: Colors.blue,
      fontFamily: "inter"
      ),
      home: SplashScreen(),
      routes: {
        AuthScreen.routeName:(context) =>AuthScreen(),
        CustomNavigationBar.routeName:(context)=> CustomNavigationBar(),
        HomeScreen.routeName: (context) => HomeScreen(),
        NextPage.routeName: (context) => NextPage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
        (value) => Navigator.pushReplacementNamed(context, CustomNavigationBar.routeName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
    );
  }
}

