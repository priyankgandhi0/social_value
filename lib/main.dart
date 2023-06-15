import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/routes_manager.dart';

import 'constant/shred_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await preferences.init();
  await preferences.putAppDeviceInfo();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social Value\'s',
      initialRoute: Routes.splashScreen,
      getPages: Routes.pages,
    );
  }
}


