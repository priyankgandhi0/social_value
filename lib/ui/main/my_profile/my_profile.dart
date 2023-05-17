import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';
import '../../../constant/app_string.dart';
import '../../../generated/assets.dart';
import '../../../theme/app_color.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/appbar_chip.dart';
import '../../../widgets/common_textfield.dart';
import '../bottom_nav_bar/bottom_navigation_screen.dart';
import 'my_profile_controller.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final MyProfileController controller = Get.put(MyProfileController());

  @override
  Widget build(BuildContext context) {
    return BottomNaviBarScreen(
      bottomColor: darkSky,
      backGround: white,
      appbar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            AppBarChip(
              onTap: () {},
              text: myProfile,
              textColor: white,
              color: sky,
            ),
          ],
        ),
        backgroundColor: darkSky,
      ),
      color: darkSky,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: GetBuilder<MyProfileController>(
              // initState: (state) {},
              builder: (ctrl) {
            return Column(
              children: [
                Container(
                  // height: 229,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            offset: const Offset(1, 1),
                            // spreadRadius: 1,
                            blurRadius: 2)
                      ],
                      color: backGroundColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "Hi, ",
                              style: const TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: ctrl.firstName,
                                  style: const TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                                const TextSpan(
                                  text: memberSinceFeb,
                                  style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      10.0.addHSpace(),
                      Image.asset(Assets.imagesMemberLogo),
                      10.0.addHSpace(),
                      memberSinceFebDesc.interTextStyle(
                        textAlign: TextAlign.center,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
                20.0.addHSpace(),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400,
                          offset: const Offset(1, 1),
                          // spreadRadius: 1,
                          blurRadius: 2)
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Form(
                    key: ctrl.formKey1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        'General Details'.interTextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                        20.0.addHSpace(),
                        Row(
                          children: [
                            Flexible(
                              child: StartUpTextFiled(
                                headingText: 'Name',
                                headingTextColor: Colors.black,
                                hintText: '',
                                fillColor: Colors.transparent,
                                borderColor: Colors.grey,
                                fontColor: Colors.black,
                                controller: ctrl.nameCtr..text = ctrl.firstName,
                                validator: (_) {
                                  if (ctrl.nameCtr.text.isEmpty) {
                                    return pleaseEnterName;
                                  }
                                  return null;
                                },
                              ),
                            ),
                            20.0.addWSpace(),
                            Flexible(
                              child: StartUpTextFiled(
                                headingText: 'name',
                                headingTextColor: white,
                                hintText: '',
                                fillColor: Colors.transparent,
                                borderColor: Colors.grey,
                                fontColor: Colors.black,
                                controller: ctrl.lastNameCtr
                                  ..text = ctrl.lastName,
                                validator: (_) {
                                  if (ctrl.lastNameCtr.text.isEmpty) {
                                    return pleaseEnterName;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        20.0.addHSpace(),
                        StartUpTextFiled(
                          headingText: 'Email',
                          headingTextColor: Colors.black,
                          hintText: '',
                          fillColor: Colors.transparent,
                          borderColor: Colors.grey,
                          fontColor: Colors.black,
                          controller: TextEditingController()
                            ..text = ctrl.email,
                          readOnly: true,
                        ),
                        30.0.addHSpace(),
                        'Replace Profile Image'.interTextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                        10.0.addHSpace(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        bottomLeft: Radius.circular(5))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 5, bottom: 5),
                                  child: Center(
                                    child: 'Choose file'.interTextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  ),
                                )),
                            Expanded(
                              flex: 1,
                              child: Container(
                                  height: 30,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(5),
                                          bottomRight: Radius.circular(5))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5, top: 4, bottom: 4),
                                    child: ''.interTextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  )),
                            )
                          ],
                        ),
                        30.0.addHSpace(),
                        SizedBox(
                          height: 37,
                          width: 100,
                          child: AppBorderButton(
                            onTap: () {
                              // print("email----${ctrl.email}");
                              // print("id----${ctrl.id}");
                              if (ctrl.formKey1.currentState!.validate()) {
                                ctrl.editProfile();
                              }
                            },
                            textSize: 14,
                            text: 'Update',
                            borderColor: darkSky,
                          ),
                        )
                      ],
                    ).paddingSymmetric(horizontal: 15, vertical: 15),
                  ),
                ),
                20.0.addHSpace(),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400,
                          offset: const Offset(1, 1),
                          // spreadRadius: 1,
                          blurRadius: 2)
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Form(
                    key: ctrl.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        'Update Password'.interTextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                        20.0.addHSpace(),
                        Row(
                          children: [
                            Obx(() {
                              return Flexible(
                                child: StartUpTextFiled(
                                  headingText: 'New Password',
                                  validator: (_) {
                                    if (ctrl.newPassCtr.text.isEmpty) {
                                      return pleaseEnterNewPass;
                                    }
                                    return null;
                                  },
                                  obscureText: ctrl.isObscureText.value,
                                  suffixIconWidget: ctrl.isObscureText.value
                                      ? const Icon(
                                          Icons.visibility_off_outlined,
                                          color: textColor,
                                        )
                                      : const Icon(
                                          Icons.visibility,
                                          color: textColor,
                                        ),
                                  suffixIconOnPress: () {
                                    ctrl.isObscureText.value =
                                        !ctrl.isObscureText.value;
                                  },
                                  controller: ctrl.newPassCtr,
                                  hintText: '',
                                  fillColor: Colors.transparent,
                                  borderColor: Colors.grey,
                                  fontColor: Colors.black,
                                ),
                              );
                            }),
                            20.0.addWSpace(),
                            Obx(() {
                              return Flexible(
                                child: StartUpTextFiled(
                                  headingText: 'Confirm New Password',
                                  // headingTextColor: white,
                                  hintText: '',
                                  fillColor: Colors.transparent,
                                  borderColor: Colors.grey,
                                  fontColor: Colors.black,
                                  controller: ctrl.confirmCtr,
                                  validator: (value) {
                                    if (ctrl.confirmCtr.text.isEmpty) {
                                      return pleaseEnterConfirmPass;
                                    } else if (value != ctrl.newPassCtr.text) {
                                      return "confirm password same as newPassword";
                                    }
                                    return null;
                                  },
                                  obscureText: ctrl.isObscureText1.value,
                                  suffixIconWidget: ctrl.isObscureText1.value
                                      ? const Icon(
                                          Icons.visibility_off_outlined,
                                          color: textColor,
                                        )
                                      : const Icon(
                                          Icons.visibility,
                                          color: textColor,
                                        ),
                                  suffixIconOnPress: () {
                                    ctrl.isObscureText1.value =
                                        !ctrl.isObscureText1.value;
                                  },
                                ),
                              );
                            })
                          ],
                        ),
                        20.0.addHSpace(),
                        Obx(() {
                          return StartUpTextFiled(
                            headingText: 'Current Password',
                            // headingTextColor: Colors.black,
                            hintText: '',
                            fillColor: Colors.transparent,
                            borderColor: Colors.grey,
                            fontColor: Colors.black,
                            controller: ctrl.currentPassCtr,
                            validator: (_) {
                              if (ctrl.currentPassCtr.text.isEmpty) {
                                return pleaseEnterOldPass;
                              }
                              return null;
                            },
                            obscureText: ctrl.isObscureText2.value,
                            suffixIconWidget: ctrl.isObscureText2.value
                                ? const Icon(
                                    Icons.visibility_off_outlined,
                                    color: textColor,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: textColor,
                                  ),
                            suffixIconOnPress: () {
                              ctrl.isObscureText2.value =
                                  !ctrl.isObscureText2.value;
                            },
                          );
                        }),
                        30.0.addHSpace(),
                        SizedBox(
                          height: 37,
                          width: 100,
                          child: AppBorderButton(
                            onTap: () {
                              if (ctrl.formKey.currentState!.validate()) {
                                ctrl.changePassword();
                              }
                            },
                            textSize: 14,
                            text: 'Update',
                            borderColor: darkSky,
                          ),
                        ),
                        10.0.addHSpace(),
                      ],
                    ).paddingSymmetric(horizontal: 15, vertical: 15),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
