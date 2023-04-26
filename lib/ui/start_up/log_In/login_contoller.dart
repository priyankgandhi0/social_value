import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LogInScreenController extends GetxController {
  RxBool isObscureText = true.obs;
  RxInt tabIndex = 0.obs;
  RxBool isLoading = false.obs;
  final signInKey = GlobalKey<FormState>();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
}
