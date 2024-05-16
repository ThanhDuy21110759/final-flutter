import 'dart:async';

import 'package:coffee_ui/api/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../entity/response/StaffResponse.dart';
import '../../service/staff_service.dart';
import 'components/form_fill.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final StaffService staffService = StaffService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: StreamBuilder<StaffResponse>(
        stream: staffService.getStaffInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          StaffResponse staffInfo = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 250,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 28),
                              blurRadius: 80
                          )
                        ],
                        image: DecorationImage(
                            image: AssetImage('assets/images/bg.png'),
                            fit: BoxFit.cover
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/user.svg',
                              height: 100,
                              width: 100,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Welcome,',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              '${staffInfo.result?.username}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                // Add your change password logic here
                                print('Change password button pressed');
                              },
                              child: const Text(
                                'Change Password',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        icon: const Icon(Icons.logout),
                        onPressed: () {
                          AuthAPI.logout();
                          Navigator.pushNamed(context, '/login');
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                FormProfile(staffInfo: staffInfo),
              ],
            ),
          );
        },
      ),
    );
  }
}