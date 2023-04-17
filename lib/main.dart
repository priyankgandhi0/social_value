import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/Routes_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social Value',
      initialRoute: Routes.splashScreen,
      getPages: Routes.pages,
    );
  }
}
