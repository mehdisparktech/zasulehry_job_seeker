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
import 'package:zasulehry_job_seeker/features/jobseeker/profile/presentation/screen/edit_work_information_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/profile/presentation/screen/profile_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/setting/presentation/screen/privacy_policy_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/setting/presentation/screen/setting_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/setting/presentation/screen/terms_of_services_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/setting/presentation/screen/language_selection_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/setting/presentation/screen/country_selection_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/setting/presentation/screen/connected_accounts_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/setting/presentation/screen/impressum_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/profile/presentation/screen/edit_profile.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/jobs/presentation/screen/my_applied_jobs_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/jobs/presentation/screen/approved_jobs_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/jobs/presentation/screen/pending_jobs_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/jobs/presentation/screen/canceled_jobs_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/jobs/presentation/screen/saved_jobs_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/feedback/presentation/screen/feedback_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/resume/presentation/screen/resume_creation_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/salary/presentation/screen/salary_calculator_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/salary/presentation/screen/salary_comparison_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/profile/presentation/screen/work_information_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/profile/presentation/screen/contact_support_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/profile/presentation/screen/share_app_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/profile/presentation/screen/personal_information_screen.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/appointments/presentation/screen/appointments_screen.dart';

// Employer imports with prefixes to avoid conflicts
import 'package:zasulehry_job_seeker/features/employer/dashboard/presentation/screen/employer_deshboared_screen.dart'
    as employer_dashboard;
import 'package:zasulehry_job_seeker/features/employer/appointments/presentation/screen/employer_appointments_screen.dart'
    as employer_appointments;
import 'package:zasulehry_job_seeker/features/employer/feedback/presentation/screen/employer_feedback_screen.dart'
    as employer_feedback;
import 'package:zasulehry_job_seeker/features/employer/jobs/presentation/screen/employer_my_applied_jobs_screen.dart'
    as employer_my_applied_jobs;
import 'package:zasulehry_job_seeker/features/employer/jobs/presentation/screen/employer_posted_jobs_screen.dart'
    as employer_posted_jobs;
import 'package:zasulehry_job_seeker/features/employer/jobs/presentation/screen/employer_saved_jobs_screen.dart'
    as employer_saved_jobs;
import 'package:zasulehry_job_seeker/features/employer/message/presentation/screen/employer_chat_screen.dart'
    as employer_chat;
import 'package:zasulehry_job_seeker/features/employer/message/presentation/screen/employer_message_screen.dart'
    as employer_message;
import 'package:zasulehry_job_seeker/features/employer/notifications/presentation/screen/employer_notifications_screen.dart'
    as employer_notifications;
import 'package:zasulehry_job_seeker/features/employer/profile/presentation/screen/employer_profile_screen.dart'
    as employer_profile;
import 'package:zasulehry_job_seeker/features/employer/profile/presentation/screen/employer_edit_profile.dart'
    as employer_edit_profile;
import 'package:zasulehry_job_seeker/features/employer/profile/presentation/screen/employer_edit_work_information_screen.dart'
    as employer_edit_work_info;
import 'package:zasulehry_job_seeker/features/employer/profile/presentation/screen/employer_work_information_screen.dart'
    as employer_work_info;
import 'package:zasulehry_job_seeker/features/employer/profile/presentation/screen/employer_contact_support_screen.dart'
    as employer_contact_support;
import 'package:zasulehry_job_seeker/features/employer/profile/presentation/screen/employer_share_app_screen.dart'
    as employer_share_app;
import 'package:zasulehry_job_seeker/features/employer/profile/presentation/screen/employer_personal_information_screen.dart'
    as employer_personal_info;
import 'package:zasulehry_job_seeker/features/employer/resume/presentation/screen/employer_resume_creation_screen.dart'
    as employer_resume;
import 'package:zasulehry_job_seeker/features/employer/salary/presentation/screen/employer_salary_calculator_screen.dart'
    as employer_salary_calc;
import 'package:zasulehry_job_seeker/features/employer/salary/presentation/screen/employer_salary_comparison_screen.dart'
    as employer_salary_comp;
import 'package:zasulehry_job_seeker/features/employer/setting/presentation/screen/employer_setting_screen.dart'
    as employer_setting;
import 'package:zasulehry_job_seeker/features/employer/setting/presentation/screen/employer_privacy_policy_screen.dart'
    as employer_privacy;
import 'package:zasulehry_job_seeker/features/employer/setting/presentation/screen/employer_terms_of_services_screen.dart'
    as employer_terms;
import 'package:zasulehry_job_seeker/features/employer/setting/presentation/screen/employer_language_selection_screen.dart'
    as employer_language;
import 'package:zasulehry_job_seeker/features/employer/setting/presentation/screen/employer_country_selection_screen.dart'
    as employer_country;
import 'package:zasulehry_job_seeker/features/employer/setting/presentation/screen/employer_connected_accounts_screen.dart'
    as employer_connected;
import 'package:zasulehry_job_seeker/features/employer/setting/presentation/screen/employer_impressum_screen.dart'
    as employer_impressum;
import 'package:zasulehry_job_seeker/features/employer/setting/presentation/screen/two_step_verification.dart'
    as employer_two_step_verification;
import 'package:zasulehry_job_seeker/features/employer/jobs/presentation/screen/employer_post_job_screen.dart'
    as employer_post_job;
import 'package:zasulehry_job_seeker/features/employer/ai_tools/presentation/screen/ai_tools_screen.dart'
    as employer_ai_tools;
import 'package:zasulehry_job_seeker/features/employer/profile/presentation/screen/employer_verify_account_screen.dart'
    as employer_verify_account;
import 'package:zasulehry_job_seeker/features/employer/download_center/presentation/screen/employer_download_center_screen.dart'
    as employer_download_center;

// Employer invoice imports
import 'package:zasulehry_job_seeker/features/employer/invoice/presentation/screen/employer_invoice_list_screen.dart'
    as employer_invoice_list;
import 'package:zasulehry_job_seeker/features/employer/invoice/presentation/screen/employer_create_invoice_screen.dart'
    as employer_create_invoice;
import 'package:zasulehry_job_seeker/features/employer/invoice/presentation/screen/employer_invoice_detail_screen.dart'
    as employer_invoice_detail;

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

  // Job Management Routes
  static const String myAppliedJobs = "/my_applied_jobs_screen.dart";
  static const String approvedJobs = "/approved_jobs_screen.dart";
  static const String pendingJobs = "/pending_jobs_screen.dart";
  static const String canceledJobs = "/canceled_jobs_screen.dart";
  static const String savedJobs = "/saved_jobs_screen.dart";
  static const String editWorkInformation =
      "/edit_work_information_screen.dart";

  // Employer Job Management Routes
  static const String employerMyAppliedJobs =
      "/employer_my_applied_jobs_screen.dart";
  static const String employerPostedJobs = "/employer_posted_jobs_screen.dart";
  static const String employerPendingJobs =
      "/employer_pending_jobs_screen.dart";
  static const String employerCanceledJobs =
      "/employer_canceled_jobs_screen.dart";
  static const String employerSavedJobs = "/employer_saved_jobs_screen.dart";
  static const String employerEditworkInformation =
      "/employer_edit_work_information_screen.dart";

  // Other Dashboard Routes
  static const String feedback = "/feedback_screen.dart";
  static const String resumeCreation = "/resume_creation_screen.dart";
  static const String salaryCalculator = "/salary_calculator_screen.dart";
  static const String salaryComparison = "/salary_comparison_screen.dart";
  static const String appointments = "/appointments_screen.dart";

  // Employer Dashboard Routes
  static const String employerFeedback = "/employer_feedback_screen.dart";
  static const String employerResumeCreation =
      "/employer_resume_creation_screen.dart";
  static const String employerSalaryCalculator =
      "/employer_salary_calculator_screen.dart";
  static const String employerSalaryComparison =
      "/employer_salary_comparison_screen.dart";
  static const String employerAppointments =
      "/employer_appointments_screen.dart";

  // Common Routes
  static const String notifications = "/notifications_screen.dart";
  static const String chat = "/chat_screen.dart";
  static const String message = "/message_screen.dart";
  static const String profile = "/profile_screen.dart";
  static const String editProfile = "/edit_profile.dart";
  static const String privacyPolicy = "/privacy_policy_screen.dart";
  static const String termsOfServices = "/terms_of_services_screen.dart";
  static const String setting = "/setting_screen.dart";
  static const String languageSelection = "/language_selection_screen.dart";
  static const String countrySelection = "/country_selection_screen.dart";
  static const String connectedAccounts = "/connected_accounts_screen.dart";
  static const String impressum = "/impressum_screen.dart";
  static const String selectRole = "/select_role_screen.dart";

  // Employer Common Routes
  static const String employerNotifications =
      "/employer_notifications_screen.dart";
  static const String employerChat = "/employer_chat_screen.dart";
  static const String employerMessage = "/employer_message_screen.dart";
  static const String employerProfile = "/employer_profile_screen.dart";
  static const String employerEditProfile = "/employer_edit_profile.dart";
  static const String employerPrivacyPolicy =
      "/employer_privacy_policy_screen.dart";
  static const String employerTermsOfServices =
      "/employer_terms_of_services_screen.dart";
  static const String employerSetting = "/employer_setting_screen.dart";
  static const String employerLanguageSelection =
      "/employer_language_selection_screen.dart";
  static const String employerCountrySelection =
      "/employer_country_selection_screen.dart";
  static const String employerConnectedAccounts =
      "/employer_connected_accounts_screen.dart";
  static const String employerImpressum = "/employer_impressum_screen.dart";

  // Profile Routes
  static const String personalInformation = "/personal_information_screen.dart";
  static const String workInformation = "/work_information_screen.dart";
  static const String contactSupport = "/contact_support_screen.dart";
  static const String shareApp = "/share_app_screen.dart";

  // Employer Profile Routes
  static const String employerWorkInformation =
      "/employer_work_information_screen.dart";
  static const String employerContactSupport =
      "/employer_contact_support_screen.dart";
  static const String employerShareApp = "/employer_share_app_screen.dart";
  static const String employerPersonalInformation =
      "/employer_personal_information_screen.dart";

  // Employer Invoice Routes
  static const String employerInvoiceList = "/employer_invoice_list";
  static const String employerCreateInvoice = "/employer_create_invoice";
  static const String employerInvoiceDetail = "/employer_invoice_detail";
  static const String employerTwoStepVerification =
      "/employer_two_step_verification";
  static const String employerPostJob = "/employer_post_job";
  static const String employerAiTools = "/employer_ai_tools";
  static const String employerVerifyAccount = "/employer_verify_account";
  static const String employerDownloadCenter = "/employer_download_center";
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
    GetPage(
      name: languageSelection,
      page: () => const LanguageSelectionScreen(),
    ),
    GetPage(name: countrySelection, page: () => const CountrySelectionScreen()),
    GetPage(
      name: connectedAccounts,
      page: () => const ConnectedAccountsScreen(),
    ),
    GetPage(name: impressum, page: () => const ImpressumScreen()),

    // Dashboard Routes
    GetPage(
      name: jobSeekerDashboard,
      page: () => const JobSeekerDeshboaredScreen(),
    ),
    GetPage(name: selectRole, page: () => const SelectRouleScreen()),

    // Job Management Routes
    GetPage(name: myAppliedJobs, page: () => const MyAppliedJobsScreen()),
    GetPage(name: approvedJobs, page: () => const ApprovedJobsScreen()),
    GetPage(name: pendingJobs, page: () => const PendingJobsScreen()),
    GetPage(name: canceledJobs, page: () => const CanceledJobsScreen()),
    GetPage(name: savedJobs, page: () => const SavedJobsScreen()),
    GetPage(
      name: editWorkInformation,
      page: () => const EditWorkInformationScreen(),
    ),

    // Other Dashboard Routes
    GetPage(name: feedback, page: () => const FeedbackScreen()),
    GetPage(name: resumeCreation, page: () => const ResumeCreationScreen()),
    GetPage(name: salaryCalculator, page: () => const SalaryCalculatorScreen()),
    GetPage(name: salaryComparison, page: () => const SalaryComparisonScreen()),

    // Profile Routes
    GetPage(
      name: personalInformation,
      page: () => const PersonalInformationScreen(),
    ),
    GetPage(name: workInformation, page: () => const WorkInformationScreen()),
    GetPage(name: contactSupport, page: () => const ContactSupportScreen()),
    GetPage(name: shareApp, page: () => const ShareAppScreen()),

    // Appointments Route
    GetPage(name: appointments, page: () => const AppointmentsScreen()),

    // Employer Routes
    GetPage(
      name: employerDashboard,
      page: () => const employer_dashboard.EmployerDeshboaredScreen(),
    ),
    GetPage(
      name: employerAppointments,
      page: () => employer_appointments.AppointmentsScreen(),
    ),
    GetPage(
      name: employerFeedback,
      page: () => employer_feedback.FeedbackScreen(),
    ),
    GetPage(
      name: employerMyAppliedJobs,
      page: () => employer_my_applied_jobs.MyAppliedJobsScreen(),
    ),
    GetPage(
      name: employerPostedJobs,
      page: () => employer_posted_jobs.EmployerPostedJobsScreen(),
    ),

    GetPage(
      name: employerSavedJobs,
      page: () => employer_saved_jobs.SavedJobsScreen(),
    ),
    GetPage(
      name: employerChat,
      page: () => employer_chat.EmployerChatListScreen(),
    ),
    GetPage(
      name: employerMessage,
      page: () => employer_message.EmployerMessageScreen(),
    ),
    GetPage(
      name: employerNotifications,
      page: () => employer_notifications.NotificationScreen(),
    ),
    GetPage(
      name: employerProfile,
      page: () => employer_profile.ProfileScreen(),
    ),
    GetPage(
      name: employerEditProfile,
      page: () => employer_edit_profile.EditProfile(),
    ),
    GetPage(
      name: employerEditworkInformation,
      page: () => employer_edit_work_info.EditWorkInformationScreen(),
    ),
    GetPage(
      name: employerWorkInformation,
      page: () => employer_work_info.WorkInformationScreen(),
    ),
    GetPage(
      name: employerContactSupport,
      page: () => employer_contact_support.ContactSupportScreen(),
    ),
    GetPage(
      name: employerShareApp,
      page: () => employer_share_app.ShareAppScreen(),
    ),
    GetPage(
      name: employerPersonalInformation,
      page: () => employer_personal_info.PersonalInformationScreen(),
    ),
    GetPage(
      name: employerResumeCreation,
      page: () => employer_resume.ResumeCreationScreen(),
    ),
    GetPage(
      name: employerSalaryCalculator,
      page: () => employer_salary_calc.SalaryCalculatorScreen(),
    ),
    GetPage(
      name: employerSalaryComparison,
      page: () => employer_salary_comp.SalaryComparisonScreen(),
    ),
    GetPage(
      name: employerSetting,
      page: () => employer_setting.EmployerSettingScreen(),
    ),
    GetPage(
      name: employerPrivacyPolicy,
      page: () => employer_privacy.PrivacyPolicyScreen(),
    ),
    GetPage(
      name: employerTermsOfServices,
      page: () => employer_terms.TermsOfServicesScreen(),
    ),
    GetPage(
      name: employerLanguageSelection,
      page: () => employer_language.LanguageSelectionScreen(),
    ),
    GetPage(
      name: employerCountrySelection,
      page: () => employer_country.CountrySelectionScreen(),
    ),
    GetPage(
      name: employerConnectedAccounts,
      page: () => employer_connected.ConnectedAccountsScreen(),
    ),
    GetPage(
      name: employerImpressum,
      page: () => employer_impressum.ImpressumScreen(),
    ),

    // Employer Invoice Routes
    GetPage(
      name: employerInvoiceList,
      page: () => employer_invoice_list.EmployerInvoiceListScreen(),
    ),
    GetPage(
      name: employerCreateInvoice,
      page: () => employer_create_invoice.EmployerCreateInvoiceScreen(),
    ),
    GetPage(
      name: employerInvoiceDetail,
      page: () => employer_invoice_detail.EmployerInvoiceDetailScreen(),
    ),
    GetPage(
      name: employerTwoStepVerification,
      page: () => employer_two_step_verification.TwoStepVerificationScreen(),
    ),
    GetPage(
      name: employerPostJob,
      page: () => employer_post_job.EmployerPostJobScreen(),
    ),
    GetPage(
      name: employerAiTools,
      page: () => employer_ai_tools.AiToolsScreen(),
    ),
    GetPage(
      name: employerVerifyAccount,
      page: () => const employer_verify_account.EmployerVerifyAccountScreen(),
    ),
    GetPage(
      name: employerDownloadCenter,
      page: () => employer_download_center.EmployerDownloadCenterScreen(),
    ),
  ];
}
