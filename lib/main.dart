import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/routes_manager.dart';

import 'constant/shred_preference.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await preferences.init();
  await preferences.putAppDeviceInfo();
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
