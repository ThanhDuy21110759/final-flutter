// This file contains all the routes of the application - Ho Thanh Duy 21110759
import 'package:coffee_ui/view/BingAI/BingAI.dart';
import 'package:coffee_ui/view/bottom_nav_bar.dart';
import 'package:coffee_ui/view/forgot_password.dart';
import 'package:coffee_ui/view/login_screen.dart';
import 'package:coffee_ui/view/sign_in.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = {
  Login.routeName: (context) => const Login(),
  SignIn.routeName: (context) => const SignIn(),
  BottomNavBar.routeName: (context) => const BottomNavBar(initialIndex: 0,),
  ForgotPassword.routeName: (context) => const ForgotPassword(),
  BingAI.routeName: (context) => const BingAI(),
};
