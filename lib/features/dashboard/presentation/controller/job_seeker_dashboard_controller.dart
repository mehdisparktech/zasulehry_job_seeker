import 'package:get/get.dart';
import '../../../../services/storage/storage_services.dart';

class JobSeekerDashboardController extends GetxController {
  bool isLoading = false;
  bool isLoadingJobs = false;

  List jobs = [];
  List applications = [];
  List recommendations = [];

  int totalApplications = 0;
  int pendingApplications = 0;
  int interviewScheduled = 0;

  @override
  void onInit() {
    super.onInit();
    loadDashboardData();
  }

  Future<void> loadDashboardData() async {
    isLoading = true;
    update();

    await Future.wait([
      fetchJobs(),
      fetchApplications(),
      fetchRecommendations(),
    ]);

    isLoading = false;
    update();
  }

  Future<void> fetchJobs() async {
    if (!LocalStorage.isLogIn) return;

    isLoadingJobs = true;
    update();

    try {
      // Add actual API call here
      // var response = await ApiService.get("${ApiEndPoint.baseUrl}/jobs");
      // if (response.statusCode == 200) {
      //   jobs = response.data['data'] ?? [];
      // }

      // Mock data for now
      jobs = [
        {
          "id": "1",
          "title": "Flutter Developer",
          "company": "Tech Solutions Ltd",
          "location": "Dhaka, Bangladesh",
          "salary": "৳50,000 - ৳80,000",
          "type": "Full-time",
          "posted": "2 days ago",
          "description":
              "We are looking for an experienced Flutter developer...",
        },
        {
          "id": "2",
          "title": "Mobile App Developer",
          "company": "Digital Innovations",
          "location": "Chittagong, Bangladesh",
          "salary": "৳40,000 - ৳70,000",
          "type": "Remote",
          "posted": "1 week ago",
          "description": "Join our team as a mobile app developer...",
        },
      ];
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
      // var response = await ApiService.get("${ApiEndPoint.baseUrl}/applications");

      // Mock data for now
      applications = [
        {
          "id": "1",
          "jobTitle": "Flutter Developer",
          "company": "Tech Solutions Ltd",
          "appliedDate": "2024-01-15",
          "status": "Under Review",
        },
        {
          "id": "2",
          "jobTitle": "Mobile Developer",
          "company": "Digital Corp",
          "appliedDate": "2024-01-10",
          "status": "Interview Scheduled",
        },
      ];

      totalApplications = applications.length;
      pendingApplications = applications
          .where((app) => app['status'] == 'Under Review')
          .length;
      interviewScheduled = applications
          .where((app) => app['status'] == 'Interview Scheduled')
          .length;
    } catch (e) {
      print("Error fetching applications: $e");
    }
  }

  Future<void> fetchRecommendations() async {
    if (!LocalStorage.isLogIn) return;

    try {
      // Add actual API call here
      // var response = await ApiService.get("${ApiEndPoint.baseUrl}/recommendations");

      // Mock data for now
      recommendations = [
        {
          "id": "1",
          "title": "Senior Flutter Developer",
          "company": "StartupXYZ",
          "match": "95%",
          "location": "Dhaka",
        },
        {
          "id": "2",
          "title": "Mobile Engineer",
          "company": "TechCorp",
          "match": "88%",
          "location": "Remote",
        },
      ];
    } catch (e) {
      print("Error fetching recommendations: $e");
    }
  }

  void applyToJob(String jobId) {
    // Add apply to job logic here
    Get.snackbar("Success", "Application submitted successfully!");
  }

  void saveJob(String jobId) {
    // Add save job logic here
    Get.snackbar("Saved", "Job saved to your favorites!");
  }

  void viewJobDetails(String jobId) {
    // Navigate to job details page
    // Get.toNamed(AppRoutes.jobDetails, arguments: jobId);
  }
}
