
import 'package:get/get.dart';

import '../../features/auth/change_password/presentation/controller/change_password_controller.dart';
import '../../features/auth/forgot password/presentation/controller/forget_password_controller.dart';
import '../../features/auth/sign in/presentation/controller/sign_in_controller.dart';
import '../../features/auth/sign up/presentation/controller/sign_up_controller.dart';
import '../../features/dashboard/presentation/controller/job_seeker_dashboard_controller.dart';
import '../../features/dashboard/presentation/controller/employer_dashboard_controller.dart';
import '../../features/employer/job_posting/presentation/controller/job_posting_controller.dart';
import '../../features/employer/candidate_management/presentation/controller/candidate_management_controller.dart';
import '../../features/job_seeker/job_search/presentation/controller/job_search_controller.dart';
import '../../features/job_seeker/application_tracking/presentation/controller/application_tracking_controller.dart';
import '../../features/message/presentation/controller/chat_controller.dart';
import '../../features/message/presentation/controller/message_controller.dart';
import '../../features/notifications/presentation/controller/notifications_controller.dart';
import '../../features/profile/presentation/controller/profile_controller.dart';
import '../../features/setting/presentation/controller/privacy_policy_controller.dart';
import '../../features/setting/presentation/controller/setting_controller.dart';
import '../../features/setting/presentation/controller/terms_of_services_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    // Auth Controllers
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => SignInController(), fenix: true);
    Get.lazyPut(() => ForgetPasswordController(), fenix: true);
    Get.lazyPut(() => ChangePasswordController(), fenix: true);
    
    // Dashboard Controllers
    Get.lazyPut(() => JobSeekerDashboardController(), fenix: true);
    Get.lazyPut(() => EmployerDashboardController(), fenix: true);
    
    // Employer Feature Controllers
    Get.lazyPut(() => JobPostingController(), fenix: true);
    Get.lazyPut(() => CandidateManagementController(), fenix: true);
    
    // Job Seeker Feature Controllers
    Get.lazyPut(() => JobSearchController(), fenix: true);
    Get.lazyPut(() => ApplicationTrackingController(), fenix: true);
    
    // Common Feature Controllers
    Get.lazyPut(() => NotificationsController(), fenix: true);
    Get.lazyPut(() => ChatController(), fenix: true);
    Get.lazyPut(() => MessageController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => SettingController(), fenix: true);
    Get.lazyPut(() => PrivacyPolicyController(), fenix: true);
    Get.lazyPut(() => TermsOfServicesController(), fenix: true);
  }
}
