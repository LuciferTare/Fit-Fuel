import 'dart:math';

import 'package:fit_and_fuel/features/widgets/app_bar.dart';
import 'package:fit_and_fuel/features/widgets/nav_button.dart';
import 'package:fit_and_fuel/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  final List<Map<String, String>> quotes = [
    {
      'quote': 'Only place to go from Failure is to Win.',
      'author': 'Tom Platz',
    },
    {
      'quote': 'LightWeight Baby',
      'author': 'Ronnie Coleman',
    },
    {
      'quote':
          'To be successful, you must dedicate yourself 100% to your training, diet and mental approach.',
      'author': 'Arnold Schwarzenegger',
    },
    {
      'quote':
          'If you want something you\'ve never had before, you have to be willing to do something you\'ve never done before.',
      'author': 'Phil Heath',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final randomQuote = quotes[random.nextInt(quotes.length)];

    return Scaffold(
      appBar: appBar(context: context),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  ClipOval(
                      child: Container(
                          height: 65,
                          color: Color(0x3ED9D9D9),
                          child: Image.asset('assets/Images/profile.png'))),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Lucifer',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'Salt',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFD9D9D9))),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Fitness Enthusiast',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0x7ED9D9D9))),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                      child: Text('"${randomQuote['quote']}"',
                          style: TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              color: Color(0xBED9D9D9)))),
                ],
              ),
              Row(
                children: [
                  Text('~${randomQuote['author']}',
                      style: TextStyle(fontSize: 16, color: Color(0xBED9D9D9))),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text('Workouts',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD9D9D9))),
                ],
              ),
              workoutCard(
                tag: 'Confidence',
                heading: 'Chest',
                image: '',
                onTap: () {},
              ),
              const SizedBox(height: 6),
              workoutCard(
                tag: 'Strength',
                heading: 'Back',
                image: '',
                onTap: () {},
              ),
              const SizedBox(height: 6),
              workoutCard(
                tag: 'Dominance',
                heading: 'Shoulders',
                image: '',
                onTap: () {},
              ),
              const SizedBox(height: 6),
              workoutCard(
                tag: 'Pride',
                heading: 'Arms',
                image: '',
                onTap: () {},
              ),
              const SizedBox(height: 6),
              workoutCard(
                tag: 'Power',
                heading: 'Legs',
                image: '',
                onTap: () {},
              ),
              const SizedBox(height: 6),
              workoutCard(
                tag: 'Endurance',
                heading: 'Cardio',
                image: '',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0x0BD9D9D9),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            activeNavButton(
              icon: Icons.home_rounded,
              label: 'Home',
              onTap: () {
                Get.offAllNamed(MyRoutes.homeRoute);
              },
            ),
            navButton(
              icon: Icons.description,
              label: 'Recipe',
              onTap: () {
                Get.offAllNamed(MyRoutes.recipeRoute);
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
            navButton(
              icon: Icons.bar_chart_outlined,
              label: 'Track',
              onTap: () {
                Get.offAllNamed(MyRoutes.calorieTrackerRoute);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget workoutCard(
      {required String tag,
      required String heading,
      required String image,
      required Function() onTap}) {
    return SizedBox(
      height: 175,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 4,
          child: Stack(
            children: [
              Positioned.fill(
                  child: Image.network('https://picsum.photos/400/300',
                      colorBlendMode: BlendMode.lighten,
                      color: Color(0xFF181A20),
                      fit: BoxFit.cover)),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Color(0xFF181A20)],
                      stops: [0.75, 1],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(8))),
                  child: Text(tag,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD9D9D9))),
                ),
              ),
              Positioned(
                left: 12,
                bottom: 12,
                child: Text(
                  heading,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                          offset: Offset(0, 1),
                          blurRadius: 2,
                          color: Colors.black54),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
