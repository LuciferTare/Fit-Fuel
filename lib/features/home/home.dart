import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipOval(
            child: Container(
              color: Color(0xFFD9D9D9),
              child: Image.asset('assets/Images/profile.png'),
            ),
          ),
        ],
      ),
    );
  }
}
