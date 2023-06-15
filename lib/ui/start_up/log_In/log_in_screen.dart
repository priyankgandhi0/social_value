import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/theme/app_color.dart';
import 'package:social_value/utils/extension.dart';
import '../../../constant/app_string.dart';

import '../../../generated/assets.dart';

import '../../../widgets/app_button.dart';
import '../../../widgets/app_progress.dart';
import '../../../widgets/common_textfield.dart';
import 'login_contoller.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);
  final LogInScreenController controller = Get.put(LogInScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGreen,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Form(
                  key: controller.signInKey,
                  child: Column(
                    children: [
                      80.0.addHSpace(),
                      Image.asset(Assets.iconsHeart),
                      32.0.addHSpace(),
                      logIn.appEpilogueTextStyle(
                          fontColor: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                      70.0.addHSpace(),
                      StartUpTextFiled(
                        headingText: emailAddress,
                        headingTextColor: white,
                        controller: controller.emailCtr,
                        validator: (_) {
                          if (controller.emailCtr.text.isEmpty) {
                            return pleaseEnterEmailAddress;
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(_!)) {
                            return enterValidEmail;
                          }
                          return null;
                        },
                        textInputType: TextInputType.emailAddress,
                      ),
                      37.0.addHSpace(),
                      Obx(() {
                        return StartUpTextFiled(
                          headingText: password,
                          headingTextColor: white,
                          controller: controller.passwordCtr,
                          validator: (_) {
                            if (controller.passwordCtr.text.isEmpty) {
                              return pleaseEnterPassword;
                            }
                            return null;
                          },
                          obscureText: controller.isObscureText.value,
                          suffixIconWidget: controller.isObscureText.value
                              ? const Icon(
                                  Icons.visibility_off_outlined,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: Colors.white,
                                ),
                          suffixIconOnPress: () {
                            controller.isObscureText.value =
                                !controller.isObscureText.value;
                          },
                        );
                      }),
                      56.0.addHSpace(),
                      AppFilledButton(
                        text: logIn,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontColor: const Color(0xff000000),
                        onTap: () {
                          if (controller.signInKey.currentState!.validate()) {
                            controller.userLogin();
                            // controller.getArticleCategories();
                          }else{
                            controller.signInKey.currentState!.save();
                          }
                        },
                      ),
                      50.0.addHSpace(),
                      forgottenPassword.interTextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontColor: white,
                          textDecoration: TextDecoration.underline),
                      12.0.addHSpace(),




                      needAnAccount.interTextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontColor: white,
                          textDecoration: TextDecoration.underline),

                      12.0.addHSpace(),

                    ],
                  ),
                ),
              ),
              Obx(() => controller.isLoading.value || controller.isLoading.value
                  ? const AppProgress()
                  : Container()),
            ],
          ),
        ),
      ),
    );
  }
}
