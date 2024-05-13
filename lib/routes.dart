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
};
