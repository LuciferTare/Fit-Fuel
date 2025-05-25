import 'package:fit_and_fuel/features/home/home.dart';
import 'package:get/get.dart';

class MyRoutes {
  static String initialRoute = "/AboutUs";
  static String homeRoute = "/Home";
  static String aboutUsRoute = "/AboutUs";
  static String accountLinkRoute = "/Acountlink";
  static String loginRoute = "/Login";
  static String priceAlertRoute = "/PriceAlert";
  static String profileRoute = "/Profile";
  static String settingRoute = "/Setting";
  static String signUpRoute = "/Signup";

  static List<GetPage> pages = [
    GetPage(name: initialRoute, page: () => Home()),
    GetPage(name: homeRoute, page: () => const Home()),
    // GetPage(name: aboutUsRoute, page: () => const AboutUs()),
    // GetPage(name: accountLinkRoute, page: () => const AccountLink()),
    // GetPage(name: loginRoute, page: () => const Login()),
    // GetPage(name: priceAlertRoute, page: () => const PriceAlert()),
    // GetPage(name: profileRoute, page: () => const Profile()),
    // GetPage(name: settingRoute, page: () => const Settings()),
    // GetPage(name: signUpRoute, page: () => const SignUp()),
  ];
}
