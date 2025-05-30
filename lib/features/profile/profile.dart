import 'package:fit_and_fuel/features/widgets/app_bar.dart';
import 'package:fit_and_fuel/features/widgets/nav_button.dart';
import 'package:fit_and_fuel/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context),
      body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(12),
              child: Column(children: [Row(children: [])]))),
      bottomNavigationBar: Container(
        color: Color(0x0BD9D9D9),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            navButton(
              icon: Icons.home_rounded,
              label: 'Home',
              onTap: () {
                Get.offAllNamed(MyRoutes.homeRoute);
              },
            ),
            navButton(
              icon: Icons.description,
              label: 'Profiles',
              onTap: () {
                Get.offAllNamed(MyRoutes.profileRoute);
              },
            ),
            navButton(
              icon: Icons.music_note_sharp,
              label: 'Music',
              onTap: () {
                Get.offAllNamed(MyRoutes.musicRoute);
              },
            ),
            navButton(
              icon: Icons.calculate,
              label: 'Calc.',
              onTap: () {
                Get.offAllNamed(MyRoutes.calorieCalculatorRoute);
              },
            ),
            activeNavButton(
              icon: Icons.watch,
              label: 'Tracker',
              onTap: () {
                Get.offAllNamed(MyRoutes.calorieTrackerRoute);
              },
            )
          ],
        ),
      ),
    );
  }
}
