import 'package:coffee_ui/routes.dart';
import 'package:coffee_ui/view/bottom_nav_bar.dart';
import 'package:coffee_ui/view/forgot_password.dart';
import 'package:coffee_ui/view/homepage/home_page.dart';
import 'package:coffee_ui/view/login_screen.dart';
import 'package:coffee_ui/view/sign_in.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Application Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Sen-Regular",
      ),
      routes: routes,
      home: Login(key: key),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
    );
  }
}
