import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/services/storage/storage_services.dart';

class CandidateManagementController extends GetxController {
  bool isLoading = false;
  bool isLoadingMore = false;

  List applications = [];
  List filteredApplications = [];

  String selectedFilter = "All";
  List<String> statusFilters = [
    "All",
    "New",
    "Reviewed",
    "Interview Scheduled",
    "Hired",
    "Rejected",
  ];

  String searchQuery = "";

  @override
  void onInit() {
    super.onInit();
    fetchApplications();
  }

  Future<void> fetchApplications() async {
    if (!LocalStorage.isLogIn) return;

    isLoading = true;
    update();

    try {
      // Add actual API call here
      // var response = await ApiService.get("${ApiEndPoint.baseUrl}/employer/applications");
      // if (response.statusCode == 200) {
      //   applications = response.data['data'] ?? [];
      // }

      // Mock data for now
      applications = [
        {
          "id": "1",
          "candidateId": "c1",
          "candidateName": "Ahmed Rahman",
          "candidateEmail": "ahmed.rahman@email.com",
          "candidatePhone": "+8801712345678",
          "jobId": "j1",
          "jobTitle": "Senior Flutter Developer",
          "appliedDate": "2024-01-15",
          "status": "New",
          "experience": "5 years",
          "location": "Dhaka",
          "skills": ["Flutter", "Dart", "Firebase", "REST API"],
          "education": "Bachelor's in Computer Science",
          "resumeUrl": "https://example.com/resume1.pdf",
          "coverLetter": "I am very interested in this position...",
          "expectedSalary": "80000",
          "portfolio": "https://github.com/ahmed-rahman",
        },
        {
          "id": "2",
          "candidateId": "c2",
          "candidateName": "Fatima Khan",
          "candidateEmail": "fatima.khan@email.com",
          "candidatePhone": "+8801723456789",
          "jobId": "j2",
          "jobTitle": "UI/UX Designer",
          "appliedDate": "2024-01-14",
          "status": "Reviewed",
          "experience": "3 years",
          "location": "Chittagong",
          "skills": ["Figma", "Adobe XD", "Sketch", "Prototyping"],
          "education": "Bachelor's in Fine Arts",
          "resumeUrl": "https://example.com/resume2.pdf",
          "coverLetter":
              "I have a passion for creating user-friendly designs...",
          "expectedSalary": "60000",
          "portfolio": "https://dribbble.com/fatima-khan",
        },
        {
          "id": "3",
          "candidateId": "c3",
          "candidateName": "Mohammad Ali",
          "candidateEmail": "mohammad.ali@email.com",
          "candidatePhone": "+8801734567890",
          "jobId": "j1",
          "jobTitle": "Senior Flutter Developer",
          "appliedDate": "2024-01-13",
          "status": "Interview Scheduled",
          "experience": "6 years",
          "location": "Sylhet",
          "skills": ["Flutter", "React Native", "Node.js", "MongoDB"],
          "education": "Master's in Software Engineering",
          "resumeUrl": "https://example.com/resume3.pdf",
          "coverLetter": "With 6 years of experience in mobile development...",
          "expectedSalary": "100000",
          "portfolio": "https://portfolio.mohammad-ali.com",
        },
        {
          "id": "4",
          "candidateId": "c4",
          "candidateName": "Sarah Ahmed",
          "candidateEmail": "sarah.ahmed@email.com",
          "candidatePhone": "+8801745678901",
          "jobId": "j3",
          "jobTitle": "Product Manager",
          "appliedDate": "2024-01-12",
          "status": "Hired",
          "experience": "4 years",
          "location": "Dhaka",
          "skills": ["Product Management", "Agile", "Analytics", "Leadership"],
          "education": "MBA",
          "resumeUrl": "https://example.com/resume4.pdf",
          "coverLetter":
              "I am excited about the opportunity to lead product development...",
          "expectedSalary": "120000",
          "portfolio": "https://linkedin.com/in/sarah-ahmed",
        },
      ];

      filteredApplications = List.from(applications);
    } catch (e) {
      print("Error fetching applications: $e");
    }

    isLoading = false;
    update();
  }

  void filterApplications(String filter) {
    selectedFilter = filter;

    if (filter == "All") {
      filteredApplications = List.from(applications);
    } else {
      filteredApplications = applications
          .where((app) => app['status'] == filter)
          .toList();
    }

    if (searchQuery.isNotEmpty) {
      _applySearchFilter();
    }

    update();
  }

  void searchApplications(String query) {
    searchQuery = query;
    _applySearchFilter();
    update();
  }

  void _applySearchFilter() {
    if (searchQuery.isEmpty) {
      if (selectedFilter == "All") {
        filteredApplications = List.from(applications);
      } else {
        filteredApplications = applications
            .where((app) => app['status'] == selectedFilter)
            .toList();
      }
    } else {
      var baseList = selectedFilter == "All"
          ? applications
          : applications
                .where((app) => app['status'] == selectedFilter)
                .toList();

      filteredApplications = baseList.where((app) {
        return app['candidateName'].toLowerCase().contains(
              searchQuery.toLowerCase(),
            ) ||
            app['jobTitle'].toLowerCase().contains(searchQuery.toLowerCase()) ||
            app['location'].toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }
  }

  Future<void> updateApplicationStatus(
    String applicationId,
    String newStatus,
  ) async {
    try {
      // Add actual API call here
      // var response = await ApiService.put(
      //   "${ApiEndPoint.baseUrl}/applications/$applicationId",
      //   body: {"status": newStatus}
      // );

      // Mock update for now
      int index = applications.indexWhere((app) => app['id'] == applicationId);
      if (index != -1) {
        applications[index]['status'] = newStatus;

        // Update filtered list if needed
        filterApplications(selectedFilter);

        Get.snackbar("Success", "Application status updated to $newStatus");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to update status: $e");
    }
  }

  void scheduleInterview(String applicationId) {
    // Navigate to interview scheduling screen
    // Get.toNamed(AppRoutes.scheduleInterview, arguments: applicationId);
    Get.snackbar("Info", "Interview scheduling feature coming soon!");
  }

  void viewCandidateProfile(String candidateId) {
    // Navigate to candidate profile screen
    // Get.toNamed(AppRoutes.candidateProfile, arguments: candidateId);
    Get.snackbar("Info", "Candidate profile feature coming soon!");
  }

  void downloadResume(String resumeUrl) {
    // Implement resume download
    Get.snackbar("Info", "Resume download feature coming soon!");
  }

  void sendMessage(String candidateId) {
    // Navigate to messaging screen
    // Get.toNamed(AppRoutes.message, arguments: candidateId);
    Get.snackbar("Info", "Messaging feature coming soon!");
  }

  void shortlistCandidate(String applicationId) {
    updateApplicationStatus(applicationId, "Shortlisted");
  }

  void rejectCandidate(String applicationId) {
    updateApplicationStatus(applicationId, "Rejected");
  }

  void hireCandidate(String applicationId) {
    updateApplicationStatus(applicationId, "Hired");
  }
}
