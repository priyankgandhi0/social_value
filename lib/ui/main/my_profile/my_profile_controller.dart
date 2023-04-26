import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyProfileController extends GetxController {
  RxBool isObscureText = true.obs;
  RxInt tabIndex = 0.obs;
  RxBool isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  TextEditingController currentPassCtr = TextEditingController();
  TextEditingController newPassCtr = TextEditingController();
  TextEditingController confirmCtr = TextEditingController();
  TextEditingController nameCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController lastNameCtr = TextEditingController();
}
