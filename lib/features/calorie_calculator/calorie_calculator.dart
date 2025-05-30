import 'package:fit_and_fuel/features/widgets/app_bar.dart';
import 'package:fit_and_fuel/features/widgets/custom_buttons.dart';
import 'package:fit_and_fuel/features/widgets/custom_textfields.dart';
import 'package:fit_and_fuel/features/widgets/nav_button.dart';
import 'package:fit_and_fuel/features/widgets/snackbar.dart';
import 'package:fit_and_fuel/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalorieCalculator extends StatefulWidget {
  const CalorieCalculator({super.key});

  @override
  State<CalorieCalculator> createState() => CalorieCalculatorState();
}

class CalorieCalculatorState extends State<CalorieCalculator> {
  String? selectedGoal, selectedGender;
  bool allField = false, calculatedMacros = false;
  final ageC = TextEditingController();
  final heightC = TextEditingController();
  final weightC = TextEditingController();
  final ageFocusNode = FocusNode();
  final heightFocusNode = FocusNode();
  final weightFocusNode = FocusNode();
  double? calories, protein, fat, carbs;

  @override
  void initState() {
    super.initState();
    addFocusListeners([ageFocusNode, heightFocusNode, weightFocusNode]);

    ageFocusNode.addListener(checkAllFields);
    heightFocusNode.addListener(checkAllFields);
    weightFocusNode.addListener(checkAllFields);
  }

  void addFocusListeners(List<FocusNode> nodes) {
    for (var node in nodes) {
      node.addListener(() => setState(() {}));
    }
  }

  void checkAllFields() {
    final allFilled = ageC.text.isNotEmpty &&
        heightC.text.isNotEmpty &&
        weightC.text.isNotEmpty;

    if (allField != allFilled) {
      setState(() {
        allField = allFilled;
      });
    }
  }

  Map<String, double> calculateMacros({
    required String goal,
    required String gender,
    required int age,
    required double height,
    required double weight,
  }) {
    double bmr = (gender == 'Male')
        ? 10 * weight + 6.25 * height - 5 * age + 5
        : 10 * weight + 6.25 * height - 5 * age - 161;
    const double activityFactor = 1.2;
    double tdee = bmr * activityFactor;
    double calories;
    switch (goal) {
      case 'Gain':
        calories = tdee * 1.15;
        break;
      case 'Lose':
        calories = tdee * 0.85;
        break;
      default:
        calories = tdee;
    }

    double proteinGrams = 1.8 * weight;
    double fatGrams = 0.8 * weight;
    double proteinCals = proteinGrams * 4;
    double fatCals = fatGrams * 9;
    double carbCals = calories - (proteinCals + fatCals);
    double carbGrams = carbCals > 0 ? carbCals / 4 : 0;

    return {
      'calories': calories,
      'protein_g': proteinGrams,
      'fat_g': fatGrams,
      'carbs_g': carbGrams,
    };
  }

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
                  Text('Calorie Calculator',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD9D9D9))),
                ],
              ),
              Row(
                children: [
                  Text('Set you Goal:',
                      style: TextStyle(fontSize: 16, color: Color(0xBED9D9D9))),
                ],
              ),
              Row(
                children: [
                  goalButton('Gain'),
                  const SizedBox(width: 5),
                  goalButton('Lose'),
                  const SizedBox(width: 5),
                  goalButton('Maintain'),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text('Gender:',
                      style: TextStyle(fontSize: 16, color: Color(0xBED9D9D9))),
                ],
              ),
              Row(
                children: [
                  genderButton('Male'),
                  const SizedBox(width: 6),
                  genderButton('Female'),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  buildTextField(
                    keyboardType: TextInputType.number,
                    controller: ageC,
                    labeltext: 'Age',
                    enabled: true,
                    obscureText: false,
                    focusNode: ageFocusNode,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  buildTextField(
                    keyboardType: TextInputType.number,
                    controller: heightC,
                    labeltext: 'Height (cm)',
                    enabled: true,
                    obscureText: false,
                    focusNode: heightFocusNode,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  buildTextField(
                    keyboardType: TextInputType.number,
                    controller: weightC,
                    labeltext: 'Weight (kg)',
                    enabled: true,
                    obscureText: false,
                    focusNode: weightFocusNode,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  buildButtons(
                    color: allField
                        ? const Color(0xFFFCD535)
                        : const Color(0xBED9D9D9),
                    label: 'Calculate',
                    labelColor: const Color(0xFF181A20),
                    onPressed: () {
                      if (selectedGoal == null ||
                          selectedGender == null ||
                          ageC.text.isEmpty ||
                          heightC.text.isEmpty ||
                          weightC.text.isEmpty) {
                        errorSnackbar(msg: 'Please fill out all fields');
                      } else {
                        final results = calculateMacros(
                          goal: selectedGoal!,
                          gender: selectedGender!,
                          age: int.parse(ageC.text),
                          height: double.parse(heightC.text),
                          weight: double.parse(weightC.text),
                        );
                        setState(() {
                          calories = double.parse(
                              results['calories']!.toStringAsFixed(2));
                          protein = double.parse(
                              results['protein_g']!.toStringAsFixed(2));
                          fat = double.parse(
                              results['fat_g']!.toStringAsFixed(2));
                          carbs = double.parse(
                              results['carbs_g']!.toStringAsFixed(2));
                          calculatedMacros = true;
                        });
                      }
                    },
                  ),
                  const SizedBox(width: 6),
                  buildButtons(
                    color: const Color(0xBED9D9D9),
                    label: 'Reset',
                    labelColor: const Color(0xFF181A20),
                    onPressed: () {
                      setState(() {
                        selectedGoal = null;
                        selectedGender = null;
                        ageC.clear();
                        heightC.clear();
                        weightC.clear();
                        calories = null;
                        protein = null;
                        fat = null;
                        carbs = null;
                        calculatedMacros = false;
                        allField = false;
                      });
                    },
                  ),
                ],
              ),
              if (calculatedMacros) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text('Your Calorie Goal',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xBED9D9D9))),
                  ],
                ),
                Row(
                  children: [
                    Text('Calorie: ',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xBED9D9D9))),
                    Text('${calories}kcal',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFD9D9D9))),
                  ],
                ),
                Row(
                  children: [
                    Text('Protein: ',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xBED9D9D9))),
                    Text('${protein}g',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFD9D9D9))),
                  ],
                ),
                Row(
                  children: [
                    Text('Fat: ',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xBED9D9D9))),
                    Text('${fat}g',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFD9D9D9))),
                  ],
                ),
                Row(
                  children: [
                    Text('Carbs: ',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xBED9D9D9))),
                    Text('${carbs}g',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFD9D9D9))),
                  ],
                ),
              ],
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
            activeNavButton(
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

  Widget goalButton(String label) {
    final bool isSelected = selectedGoal == label;
    return Container(
      constraints: BoxConstraints.tightFor(height: 35),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color:
              isSelected ? const Color(0xFFFCD535) : const Color(0xBED9D9D9)),
      child: TextButton(
        onPressed: () {
          setState(() {
            selectedGoal = label;
          });
        },
        style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 5)),
        child: Text(label,
            style: TextStyle(fontSize: 16, color: const Color(0xFF181A20))),
      ),
    );
  }

  Widget genderButton(String label) {
    final bool isSelected = selectedGender == label;
    return Expanded(
      child: Container(
        constraints: BoxConstraints.tightFor(height: 35),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color:
                isSelected ? const Color(0xFFFCD535) : const Color(0xBED9D9D9)),
        child: TextButton(
          onPressed: () {
            setState(() {
              selectedGender = label;
            });
          },
          style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 5)),
          child: Text(label,
              style: TextStyle(fontSize: 16, color: const Color(0xFF181A20))),
        ),
      ),
    );
  }
}
