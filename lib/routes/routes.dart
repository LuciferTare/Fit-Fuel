import 'package:fit_and_fuel/features/calorie_calculator/calorie_calculator.dart';
import 'package:fit_and_fuel/features/calorie_tracker/calorie_tracker.dart';
import 'package:fit_and_fuel/features/home/home.dart';
import 'package:fit_and_fuel/features/music/music.dart';
import 'package:fit_and_fuel/features/profile/profile.dart';
import 'package:fit_and_fuel/features/recipe/recipe.dart';
import 'package:get/get.dart';

class MyRoutes {
  static String initialRoute = "/Home";
  static String homeRoute = "/Home";
  static String recipeRoute = "/Recipe";
  static String musicRoute = "/Music";
  static String calorieCalculatorRoute = "/CalorieCalculator";
  static String calorieTrackerRoute = "/CalorieTracker";
  static String profileRoute = "/Profile";

  static String aboutUsRoute = "/AboutUs";
  static String accountLinkRoute = "/Acountlink";
  static String loginRoute = "/Login";
  static String settingRoute = "/Setting";
  static String signUpRoute = "/Signup";

  static List<GetPage> pages = [
    GetPage(name: initialRoute, page: () => Home()),
    GetPage(name: homeRoute, page: () => const Home()),
    GetPage(name: recipeRoute, page: () => const Recipe()),
    GetPage(name: musicRoute, page: () => const Music()),
    GetPage(
        name: calorieCalculatorRoute, page: () => const CalorieCalculator()),
    GetPage(name: calorieTrackerRoute, page: () => const CalorieTracker()),
    GetPage(name: profileRoute, page: () => const Profile()),
    // GetPage(name: aboutUsRoute, page: () => const AboutUs()),
    // GetPage(name: accountLinkRoute, page: () => const AccountLink()),
    // GetPage(name: loginRoute, page: () => const Login()),
    // GetPage(name: settingRoute, page: () => const Settings()),
    // GetPage(name: signUpRoute, page: () => const SignUp()),
  ];
}
