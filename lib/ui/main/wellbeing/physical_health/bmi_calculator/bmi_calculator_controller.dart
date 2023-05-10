import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BmiCalculatorController extends GetxController {
  RxBool isCalculate = false.obs;
  final key = GlobalKey<FormState>();
  TextEditingController weightCtrl = TextEditingController();
  TextEditingController heightCtrl = TextEditingController();
  // double? result;
  // calculateBMI() {
  //   double height = double.parse(heightCtrl.text) / 100;
  //   double weight = double.parse(weightCtrl.text);
  //   double heightSquare = height * height;
  //   double total = weight / heightSquare;
  //   result = total;
  //   // return result;
  // }

  @override
  void dispose() {
    weightCtrl.clear();
    heightCtrl.clear();
    super.dispose();
  }
}
