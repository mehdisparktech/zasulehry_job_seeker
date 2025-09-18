import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/dashboard/presentation/screen/job_seeker_deshboared_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/presentation/screen/job_seeker_home_screen.dart';
import 'package:zasulehry_job_seeker/features/common/onboarding_screen/select_roule_screen.dart';
import 'package:zasulehry_job_seeker/features/common/splash/splash_screen.dart';
import 'package:zasulehry_job_seeker/features/common/onboarding_screen/onboarding_screen.dart';
import 'package:zasulehry_job_seeker/features/common/auth/sign%20up/presentation/screen/sign_up_screen.dart';
import 'package:zasulehry_job_seeker/features/common/auth/sign%20up/presentation/screen/verify_user.dart';
import 'package:zasulehry_job_seeker/features/common/auth/sign%20in/presentation/screen/sign_in_screen.dart';
import 'package:zasulehry_job_seeker/features/common/auth/forgot%20password/presentation/screen/forgot_password.dart';
import 'package:zasulehry_job_seeker/features/common/auth/forgot%20password/presentation/screen/verify_screen.dart';
import 'package:zasulehry_job_seeker/features/common/auth/forgot%20password/presentation/screen/create_password.dart';
import 'package:zasulehry_job_seeker/features/common/auth/change_password/presentation/screen/change_password_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/notifications/presentation/screen/notifications_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/message/presentation/screen/chat_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/message/presentation/screen/message_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/profile/presentation/screen/profile_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/setting/presentation/screen/privacy_policy_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/setting/presentation/screen/setting_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/setting/presentation/screen/terms_of_services_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/profile/presentation/screen/edit_profile.dart';

class AppRoutes {
  static const String test = "/test_screen.dart";
  static const String jobSeekerHome = "/job_seeker_home_screen.dart";
  static const String splash = "/splash_screen.dart";
  static const String onboarding = "/onboarding_screen.dart";
  static const String signUp = "/sign_up_screen.dart";
  static const String verifyUser = "/verify_user.dart";
  static const String signIn = "/sign_in_screen.dart";
  static const String forgotPassword = "/forgot_password.dart";
  static const String verifyEmail = "/verify_screen.dart";
  static const String createPassword = "/create_password.dart";
  static const String changePassword = "/change_password_screen.dart";

  // Dashboard Routes
  static const String jobSeekerDashboard = "/job_seeker_dashboard.dart";
  static const String employerDashboard = "/employer_dashboard.dart";

  // Common Routes
  static const String notifications = "/notifications_screen.dart";
  static const String chat = "/chat_screen.dart";
  static const String message = "/message_screen.dart";
  static const String profile = "/profile_screen.dart";
  static const String editProfile = "/edit_profile.dart";
  static const String privacyPolicy = "/privacy_policy_screen.dart";
  static const String termsOfServices = "/terms_of_services_screen.dart";
  static const String setting = "/setting_screen.dart";
  static const String selectRole = "/select_role_screen.dart";
  static List<GetPage> routes = [
    GetPage(name: jobSeekerHome, page: () => const JobSeekerHomeScreen()),
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: signUp, page: () => SignUpScreen()),
    GetPage(name: verifyUser, page: () => const VerifyUser()),
    GetPage(name: signIn, page: () => SignInScreen()),
    GetPage(name: forgotPassword, page: () => ForgotPasswordScreen()),
    GetPage(name: verifyEmail, page: () => const VerifyScreen()),
    GetPage(name: createPassword, page: () => CreatePassword()),
    GetPage(name: changePassword, page: () => ChangePasswordScreen()),
    // Common Routes
    GetPage(name: notifications, page: () => const NotificationScreen()),
    GetPage(name: chat, page: () => const ChatListScreen()),
    GetPage(name: message, page: () => const MessageScreen()),
    GetPage(name: profile, page: () => const ProfileScreen()),
    GetPage(name: editProfile, page: () => EditProfile()),
    GetPage(name: privacyPolicy, page: () => const PrivacyPolicyScreen()),
    GetPage(name: termsOfServices, page: () => const TermsOfServicesScreen()),
    GetPage(name: setting, page: () => const SettingScreen()),

    // Dashboard Routes
    GetPage(
      name: jobSeekerDashboard,
      page: () => const JobSeekerDeshboaredScreen(),
    ),
    GetPage(name: selectRole, page: () => const SelectRouleScreen()),
  ];
}
