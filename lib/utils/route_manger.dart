import 'package:get/get.dart';
import 'package:sitapp/global.dart';
import 'package:sitapp/ui/main/caregiver/caregiver_profile_screen.dart';
import 'package:sitapp/ui/main/common/patients/patient_profile_screen.dart';
import '../ui/main/common/about_us/about_us_screen.dart';
import '../ui/main/common/dashboard/main_dashboard_screen.dart';
import '../ui/main/common/drawer_screen.dart';
import '../ui/main/common/edit_profile/edit_profile_screen.dart';
import '../ui/main/common/message_dashboard/chat_screen/chat_screen.dart';
import '../ui/main/common/message_dashboard/messages_screen/message_screen.dart';
import '../ui/main/common/message_dashboard/my_connection_screen/my_connection_screen.dart';
import '../ui/main/common/patients/add_patients_screen.dart';
import '../ui/main/common/patients/patients_screen.dart';
import '../ui/startup/auth/verification/email_verification_screen.dart';

class Routes {
  static const String splash = "/";
  static const String welcomeScreen = "/WelcomeScreen";
  static const String mainDashBoardScreen = "/MainDashBoardScreen";
  static const String loginScreen = "/LoginScreen";
  static const String registerScreen = "/RegisterScreen";
  static const String forgotPasswordScreen = "/ForgotPasswordScreen";
  static const String resetPasswordScreen = "/ResetPasswordScreen";
  static const String privacyPolicy = "/PrivacyPolicy";
  static const String termsCondition = "/TermsCondition";
  static const String homeScreen = "/HomePage";
  static const String uploadPhotoScreen = "/UploadPhotoScreen";
  static const String bottomBarScreen = "/BottomBarScreen";
  static const String changePasswordScreen = "/ChangePasswordScreen";
  static const String contactUsScreen = "/ContactUsScreen";
  static const String drawerScreen = "/DrawerScreen";
  static const String dashBoardScreen = "/DashBoardScreen";
  static const String chatScreen = "/ChatScreen";
  static const String patientsScreen = "/PatientsScreen";
  static const String addPatientsScreen = "/AddPatientsScreen";
  static const String patientProfileScreen = "/PatientProfileScreen";
  static const String aboutUsScreen = "/AboutUsScreen";
  static const String editProfileScreen = "/EditProfileScreen";
  static const String messageScreen = "/MessageScreen";
  static const String careGiverProfileScreen = "/CareGiverProfileScreen";
  static const String emailVerify = "/EmailVerify";
  static const String myConnectionScreen = "/MyConnectionScreen";

  static List<GetPage> pages = [
    GetPage(
        name: Routes.splash,
        page: () => const SplashScreen(),
        transition: Transition.noTransition),
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.mainDashBoardScreen,
      page: () => DashBoardMainScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: Routes.privacyPolicy,
      page: () => const PrivacyScreen(),
    ),
    GetPage(
      name: Routes.careGiverProfileScreen,
      page: () => CareGiverProfileScreen(),
    ),
    GetPage(
      name: Routes.termsCondition,
      page: () => const TermsScreen(),
    ),
    GetPage(
      name: Routes.uploadPhotoScreen,
      page: () => UploadPhotoScreen(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => const ForgetScreen(),
    ),
    GetPage(
      name: Routes.bottomBarScreen,
      page: () => BottomBarScreen(),
    ),
    GetPage(
      name: Routes.resetPasswordScreen,
      page: () => const ResetPasswordScreen(),
    ),
    GetPage(
      name: Routes.emailVerify,
      page: () => EmailVerify(),
    ),
    GetPage(
      name: Routes.contactUsScreen,
      page: () => const ContactUsScreen(),
    ),
    GetPage(
      name: Routes.messageScreen,
      page: () => MessageScreen(),
    ),
    GetPage(
      name: Routes.changePasswordScreen,
      page: () => ChangePasswordScreen(),
    ),
    GetPage(
      name: Routes.drawerScreen,
      page: () => DrawerScreen(),
    ),
    GetPage(
      name: Routes.dashBoardScreen,
      page: () => const DashBoardScreen(),
    ),
    GetPage(
      name: Routes.chatScreen,
      page: () => const ChatScreen(),
    ),
    GetPage(
      name: Routes.patientsScreen,
      page: () => PatientsScreen(),
    ),
    GetPage(
      name: Routes.addPatientsScreen,
      page: () => AddPatientsScreen(),
    ),
    GetPage(
      name: Routes.patientProfileScreen,
      page: () => PatientProfileScreen(),
    ),
    GetPage(
      name: Routes.aboutUsScreen,
      page: () => AboutUsScreen(),
    ),
    GetPage(
      name: Routes.editProfileScreen,
      page: () => EditProfileScreen(),
    ),
    GetPage(
      name: Routes.myConnectionScreen,
      page: () => const MyConnectionScreen(),
    ),
  ];

  static navigateToMessageScreen(String receiverToken, String receiverName) {
    if ((preferences.getString(SharedPreference.USER_TOKEN) ?? "") !=
        receiverToken) {
      Get.toNamed(Routes.chatScreen, parameters: {
        "receiver_token": receiverToken,
        "receiver_name": receiverName,
      });
    }
  }
}
