import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CarbonFootPrintController extends GetxController {
  RxBool isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController lastNameCtr = TextEditingController();
}
