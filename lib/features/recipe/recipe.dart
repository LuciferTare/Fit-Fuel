import 'package:fit_and_fuel/features/widgets/app_bar.dart';
import 'package:fit_and_fuel/features/widgets/nav_button.dart';
import 'package:fit_and_fuel/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Recipe extends StatefulWidget {
  const Recipe({super.key});

  @override
  State<Recipe> createState() => RecipeState();
}

class RecipeState extends State<Recipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Featured Recipes',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD9D9D9))),
                ],
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: List.generate(10, (index) {
                      return Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: recipeCard(
                          tag: index + 1,
                          heading: 'Recipe ${index + 1}',
                          image:
                              'https://picsum.photos/id/${index + 10}/300/300',
                          onTap: () {},
                        ),
                      );
                    }),
                  );
                },
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
            navButton(
              icon: Icons.home_rounded,
              label: 'Home',
              onTap: () {
                Get.offAllNamed(MyRoutes.homeRoute);
              },
            ),
            activeNavButton(
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

  Widget recipeCard(
      {required String heading,
      required int tag,
      required String image,
      required Function() onTap}) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(7.5),
          decoration: BoxDecoration(
              color: Color(0xBED9D9D9), borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://picsum.photos/300/300',
                      width: 75,
                      height: 75,
                      colorBlendMode: BlendMode.lighten,
                      color: Color(0xFF181A20),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(heading,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF181A20))),
                    const Text('Macros',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF181A20))),
                    Table(
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(1),
                      },
                      children: const [
                        TableRow(
                          children: [
                            Text('Cal: 385 Cal',
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF181A20))),
                            Text('Carbs: 38.5g',
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF181A20))),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text('Fat: 19.7g',
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF181A20))),
                            Text('Protein: 16.3g',
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF181A20))),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8))),
            child: Text('Serves: $tag',
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD9D9D9))),
          ),
        ),
      ],
    );
  }
}
