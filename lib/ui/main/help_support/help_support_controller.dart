import 'package:get/get.dart';

class HelpSupportController extends GetxController {
  var visibility = true.obs;
  var index = 0.obs;

  void changed(bool visibal, String field) {
    if (field == "text") {
      visibility.value = visibal;
    }
    update();
  }
}
