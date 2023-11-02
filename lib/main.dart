import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'core/app_pages.dart';
import 'core/resources/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PunktE',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      initialRoute: AppPages.toMainScreen,
      getPages: AppPages.routes,
    );
  }
}

