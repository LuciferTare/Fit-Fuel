import 'package:fit_and_fuel/routes/routes.dart';
import 'package:fit_and_fuel/utlis/theme.dart';
import 'package:fit_and_fuel/utlis/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialBinding: InitialBindings(),
      initialRoute: MyRoutes.initialRoute,
      getPages: MyRoutes.pages,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeController.theme,
      debugShowCheckedModeBanner: false,
    );
  }
}
