import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/features/common/auth/change_password/presentation/controller/change_password_controller.dart';
import 'package:zasulehry_job_seeker/features/common/auth/forgot%20password/presentation/controller/forget_password_controller.dart';
import 'package:zasulehry_job_seeker/features/common/auth/sign%20in/presentation/controller/sign_in_controller.dart';
import 'package:zasulehry_job_seeker/features/employer/message/presentation/controller/employer_message_controller.dart';
import 'package:zasulehry_job_seeker/features/employer/message/presentation/screen/employer_chat_screen.dart';
import 'package:zasulehry_job_seeker/features/employer/notifications/presentation/controller/employee_notification_setting_controller.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/appointments/presentation/controller/appointments_controller.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/presentation/controller/job_seeker_home_controller.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/notifications/presentation/controller/notifications_controller.dart';
import 'package:zasulehry_job_seeker/features/common/auth/sign%20up/presentation/controller/sign_up_controller.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/message/presentation/controller/chat_controller.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/message/presentation/controller/message_controller.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/profile/presentation/controller/profile_controller.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/setting/presentation/controller/privacy_policy_controller.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/setting/presentation/controller/setting_controller.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/setting/presentation/controller/terms_of_services_controller.dart';
import 'package:zasulehry_job_seeker/features/employer/profile/presentation/controller/employer_profile_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    // Auth Controllers
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => SignInController(), fenix: true);
    Get.lazyPut(() => ForgetPasswordController(), fenix: true);
    Get.lazyPut(() => ChangePasswordController(), fenix: true);

    // Common Feature Controllers
    Get.lazyPut(() => NotificationsController(), fenix: true);
    Get.lazyPut(() => ChatController(), fenix: true);
    Get.lazyPut(() => MessageController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => SettingController(), fenix: true);
    Get.lazyPut(() => PrivacyPolicyController(), fenix: true);
    Get.lazyPut(() => TermsOfServicesController(), fenix: true);
    Get.lazyPut(() => EmployerMessageController(), fenix: true);
    Get.lazyPut(() => EmployerChatListScreen(), fenix: true);
    Get.lazyPut(() => EmployerProfileController(), fenix: true);
    Get.lazyPut(() => JobSeekerHomeController(), fenix: true);
    Get.lazyPut(() => AppointmentsController(), fenix: true);
    Get.lazyPut(() => EmployeeNotificationSettingController(), fenix: true);
  }
}
