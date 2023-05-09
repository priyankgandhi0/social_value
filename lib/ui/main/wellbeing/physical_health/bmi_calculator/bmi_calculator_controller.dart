import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BmiCalculatorController extends GetxController {
  RxBool isCalculate = false.obs;
  final key = GlobalKey<FormState>();
  TextEditingController weightCtrl = TextEditingController();
  TextEditingController heightCtrl = TextEditingController();
  @override
  void dispose() {
    super.dispose();
  }
}
