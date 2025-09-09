import 'package:get/get.dart';
import '../../../../config/route/app_routes.dart';
import '../../../../services/storage/storage_services.dart';

class EmployerDashboardController extends GetxController {
  bool isLoading = false;
  bool isLoadingJobs = false;

  List myJobs = [];
  List applications = [];
  List candidates = [];

  int totalJobs = 0;
  int activeJobs = 0;
  int totalApplications = 0;
  int newApplications = 0;

  @override
  void onInit() {
    super.onInit();
    loadDashboardData();
  }

  Future<void> loadDashboardData() async {
    isLoading = true;
    update();

    await Future.wait([fetchMyJobs(), fetchApplications(), fetchCandidates()]);

    isLoading = false;
    update();
  }

  Future<void> fetchMyJobs() async {
    if (!LocalStorage.isLogIn) return;

    isLoadingJobs = true;
    update();

    try {
      // Add actual API call here
      // var response = await ApiService.get("${ApiEndPoint.baseUrl}/employer/jobs");
      // if (response.statusCode == 200) {
      //   myJobs = response.data['data'] ?? [];
      // }

      // Mock data for now
      myJobs = [
        {
          "id": "1",
          "title": "Senior Flutter Developer",
          "department": "Engineering",
          "location": "Dhaka, Bangladesh",
          "salary": "৳80,000 - ৳120,000",
          "type": "Full-time",
          "status": "Active",
          "applicants": 25,
          "posted": "3 days ago",
          "description": "We are seeking a senior Flutter developer...",
        },
        {
          "id": "2",
          "title": "UI/UX Designer",
          "department": "Design",
          "location": "Remote",
          "salary": "৳50,000 - ৳80,000",
          "type": "Contract",
          "status": "Active",
          "applicants": 18,
          "posted": "1 week ago",
          "description": "Looking for a creative UI/UX designer...",
        },
      ];

      totalJobs = myJobs.length;
      activeJobs = myJobs.where((job) => job['status'] == 'Active').length;
    } catch (e) {
      print("Error fetching jobs: $e");
    }

    isLoadingJobs = false;
    update();
  }

  Future<void> fetchApplications() async {
    if (!LocalStorage.isLogIn) return;

    try {
      // Add actual API call here
      // var response = await ApiService.get("${ApiEndPoint.baseUrl}/employer/applications");

      // Mock data for now
      applications = [
        {
          "id": "1",
          "candidateName": "Ahmed Rahman",
          "jobTitle": "Senior Flutter Developer",
          "appliedDate": "2024-01-15",
          "status": "New",
          "experience": "5 years",
          "location": "Dhaka",
        },
        {
          "id": "2",
          "candidateName": "Fatima Khan",
          "jobTitle": "UI/UX Designer",
          "appliedDate": "2024-01-14",
          "status": "Reviewed",
          "experience": "3 years",
          "location": "Chittagong",
        },
        {
          "id": "3",
          "candidateName": "Mohammad Ali",
          "jobTitle": "Senior Flutter Developer",
          "appliedDate": "2024-01-13",
          "status": "Interview Scheduled",
          "experience": "6 years",
          "location": "Sylhet",
        },
      ];

      totalApplications = applications.length;
      newApplications = applications
          .where((app) => app['status'] == 'New')
          .length;
    } catch (e) {
      print("Error fetching applications: $e");
    }
  }

  Future<void> fetchCandidates() async {
    if (!LocalStorage.isLogIn) return;

    try {
      // Add actual API call here
      // var response = await ApiService.get("${ApiEndPoint.baseUrl}/candidates");

      // Mock data for now
      candidates = [
        {
          "id": "1",
          "name": "Sarah Ahmed",
          "title": "Flutter Developer",
          "experience": "4 years",
          "skills": ["Flutter", "Dart", "Firebase"],
          "location": "Dhaka",
          "availability": "Available",
        },
        {
          "id": "2",
          "name": "Rahim Hassan",
          "title": "Mobile Developer",
          "experience": "3 years",
          "skills": ["React Native", "JavaScript"],
          "location": "Chittagong",
          "availability": "Available",
        },
      ];
    } catch (e) {
      print("Error fetching candidates: $e");
    }
  }

  void createNewJob() {
    // Navigate to job creation page
    Get.toNamed(AppRoutes.jobPosting);
  }

  void viewJobDetails(String jobId) {
    // Navigate to job details page
    // Get.toNamed(AppRoutes.employerJobDetails, arguments: jobId);
  }

  void viewApplications(String jobId) {
    // Navigate to applications page
    Get.toNamed(AppRoutes.candidateManagement);
  }

  void reviewApplication(String applicationId) {
    // Navigate to application review page
    // Get.toNamed(AppRoutes.reviewApplication, arguments: applicationId);
  }

  void contactCandidate(String candidateId) {
    // Navigate to candidate contact page
    Get.snackbar("Info", "Contact candidate feature coming soon!");
  }
}
