import 'package:coffee_ui/api/CondimentController.dart';
import 'package:coffee_ui/api/ProductController.dart';
import 'package:coffee_ui/view/sign_in.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  static String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
              Image.asset(
                'assets/images/store.png',
                height: 200,
              ),
              const SizedBox(height: 20),
              RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "It's Great ",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "Day for",
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                "Coffee",
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //login button
              const SizedBox(height: 45),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the buttons horizontally
                children: [
                  TextButton(
                    onPressed: () {
                      // call api here

                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.brown,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20), // Add some space between the buttons
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignIn.routeName);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                      side: const BorderSide(color: Colors.brown, width: 2),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              //set bottom
              const Spacer(),
              // Your icon and slogan
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.coffee),
                    onPressed: () {},
                  ),
                  const Text(
                    "COFFEE HUB",
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}