import 'package:get/get.dart';
import 'package:flutter/material.dart';

class JobSearchController extends GetxController {
  bool isLoading = false;
  bool isLoadingMore = false;

  List jobs = [];
  List filteredJobs = [];
  List savedJobs = [];

  ScrollController scrollController = ScrollController();

  String searchQuery = "";
  String selectedLocation = "All Locations";
  String selectedJobType = "All Types";
  String selectedExperience = "All Levels";
  String selectedSalary = "All Ranges";

  List<String> locations = [
    "All Locations",
    "Dhaka",
    "Chittagong",
    "Sylhet",
    "Rajshahi",
    "Khulna",
    "Remote",
  ];
  List<String> jobTypes = [
    "All Types",
    "Full-time",
    "Part-time",
    "Contract",
    "Remote",
    "Hybrid",
  ];
  List<String> experienceLevels = [
    "All Levels",
    "Entry Level",
    "Mid Level",
    "Senior Level",
    "Executive",
  ];
  List<String> salaryRanges = [
    "All Ranges",
    "20k-40k",
    "40k-60k",
    "60k-80k",
    "80k-100k",
    "100k+",
  ];

  @override
  void onInit() {
    super.onInit();
    fetchJobs();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadMoreJobs();
    }
  }

  Future<void> fetchJobs() async {
    isLoading = true;
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
          "title": "Senior Flutter Developer",
          "company": "Tech Solutions Ltd",
          "companyLogo": "https://via.placeholder.com/50",
          "location": "Dhaka, Bangladesh",
          "salary": "৳80,000 - ৳120,000",
          "type": "Full-time",
          "experience": "Senior Level",
          "posted": "2 days ago",
          "deadline": "2024-02-15",
          "description":
              "We are looking for an experienced Flutter developer to join our team...",
          "requirements": [
            "5+ years Flutter experience",
            "Experience with Firebase",
            "Knowledge of REST APIs",
          ],
          "skills": ["Flutter", "Dart", "Firebase", "REST API", "Git"],
          "benefits": [
            "Health Insurance",
            "Flexible Hours",
            "Performance Bonus",
          ],
          "isRemote": false,
          "applicationCount": 25,
          "companySize": "50-100 employees",
          "industry": "Technology",
        },
        {
          "id": "2",
          "title": "Mobile App Developer",
          "company": "Digital Innovations",
          "companyLogo": "https://via.placeholder.com/50",
          "location": "Chittagong, Bangladesh",
          "salary": "৳50,000 - ৳80,000",
          "type": "Remote",
          "experience": "Mid Level",
          "posted": "1 week ago",
          "deadline": "2024-02-20",
          "description":
              "Join our team as a mobile app developer and work on exciting projects...",
          "requirements": [
            "3+ years mobile development",
            "React Native or Flutter",
            "Team collaboration",
          ],
          "skills": ["React Native", "Flutter", "JavaScript", "TypeScript"],
          "benefits": ["Remote Work", "Learning Budget", "Annual Bonus"],
          "isRemote": true,
          "applicationCount": 18,
          "companySize": "20-50 employees",
          "industry": "Digital Agency",
        },
        {
          "id": "3",
          "title": "UI/UX Designer",
          "company": "Creative Studio",
          "companyLogo": "https://via.placeholder.com/50",
          "location": "Dhaka, Bangladesh",
          "salary": "৳40,000 - ৳70,000",
          "type": "Full-time",
          "experience": "Mid Level",
          "posted": "3 days ago",
          "deadline": "2024-02-18",
          "description":
              "We are seeking a talented UI/UX designer to create amazing user experiences...",
          "requirements": [
            "3+ years design experience",
            "Proficiency in Figma",
            "Portfolio required",
          ],
          "skills": [
            "Figma",
            "Adobe XD",
            "Sketch",
            "Prototyping",
            "User Research",
          ],
          "benefits": [
            "Creative Environment",
            "Design Tools",
            "Professional Development",
          ],
          "isRemote": false,
          "applicationCount": 32,
          "companySize": "10-20 employees",
          "industry": "Design",
        },
      ];

      filteredJobs = List.from(jobs);
    } catch (e) {
      print("Error fetching jobs: $e");
    }

    isLoading = false;
    update();
  }

  Future<void> loadMoreJobs() async {
    if (isLoadingMore) return;

    isLoadingMore = true;
    update();

    // Simulate loading more jobs
    await Future.delayed(const Duration(seconds: 1));

    isLoadingMore = false;
    update();
  }

  void searchJobs(String query) {
    searchQuery = query;
    _applyFilters();
  }

  void setLocation(String location) {
    selectedLocation = location;
    _applyFilters();
  }

  void setJobType(String type) {
    selectedJobType = type;
    _applyFilters();
  }

  void setExperience(String experience) {
    selectedExperience = experience;
    _applyFilters();
  }

  void setSalary(String salary) {
    selectedSalary = salary;
    _applyFilters();
  }

  void _applyFilters() {
    filteredJobs = jobs.where((job) {
      // Search query filter
      bool matchesSearch =
          searchQuery.isEmpty ||
          job['title'].toLowerCase().contains(searchQuery.toLowerCase()) ||
          job['company'].toLowerCase().contains(searchQuery.toLowerCase()) ||
          job['description'].toLowerCase().contains(searchQuery.toLowerCase());

      // Location filter
      bool matchesLocation =
          selectedLocation == "All Locations" ||
          job['location'].toLowerCase().contains(
            selectedLocation.toLowerCase(),
          ) ||
          (selectedLocation == "Remote" && job['isRemote'] == true);

      // Job type filter
      bool matchesType =
          selectedJobType == "All Types" || job['type'] == selectedJobType;

      // Experience filter
      bool matchesExperience =
          selectedExperience == "All Levels" ||
          job['experience'] == selectedExperience;

      // Salary filter (simplified)
      bool matchesSalary =
          selectedSalary == "All Ranges" ||
          _checkSalaryRange(job['salary'], selectedSalary);

      return matchesSearch &&
          matchesLocation &&
          matchesType &&
          matchesExperience &&
          matchesSalary;
    }).toList();

    update();
  }

  bool _checkSalaryRange(String jobSalary, String selectedRange) {
    // Simplified salary range checking
    // In a real app, you would parse the salary strings and compare ranges
    return true; // For now, return true
  }

  void clearFilters() {
    searchQuery = "";
    selectedLocation = "All Locations";
    selectedJobType = "All Types";
    selectedExperience = "All Levels";
    selectedSalary = "All Ranges";
    filteredJobs = List.from(jobs);
    update();
  }

  Future<void> applyToJob(String jobId) async {
    try {
      // Add actual API call here
      // var response = await ApiService.post(
      //   "${ApiEndPoint.baseUrl}/applications",
      //   body: {"jobId": jobId, "userId": LocalStorage.userId}
      // );

      Get.snackbar("Success", "Application submitted successfully!");
    } catch (e) {
      Get.snackbar("Error", "Failed to apply: $e");
    }
  }

  Future<void> saveJob(String jobId) async {
    try {
      if (savedJobs.contains(jobId)) {
        savedJobs.remove(jobId);
        Get.snackbar("Removed", "Job removed from saved list");
      } else {
        savedJobs.add(jobId);
        Get.snackbar("Saved", "Job saved successfully!");
      }

      // Add actual API call here
      // var response = await ApiService.post(
      //   "${ApiEndPoint.baseUrl}/saved-jobs",
      //   body: {"jobId": jobId, "userId": LocalStorage.userId}
      // );

      update();
    } catch (e) {
      Get.snackbar("Error", "Failed to save job: $e");
    }
  }

  bool isJobSaved(String jobId) {
    return savedJobs.contains(jobId);
  }

  void viewJobDetails(String jobId) {
    // Navigate to job details screen
    // Get.toNamed(AppRoutes.jobDetails, arguments: jobId);

    // For now, show a dialog with job details
    final job = jobs.firstWhere((j) => j['id'] == jobId);
    _showJobDetailsDialog(job);
  }

  void _showJobDetailsDialog(Map job) {
    Get.dialog(
      Dialog(
        child: Container(
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(maxHeight: 600),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                job['title'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(job['company']),
              const SizedBox(height: 16),
              Text("Description: ${job['description']}"),
              const SizedBox(height: 16),
              Text("Requirements: ${job['requirements'].join(', ')}"),
              const SizedBox(height: 16),
              Text("Skills: ${job['skills'].join(', ')}"),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        applyToJob(job['id']);
                      },
                      child: const Text("Apply Now"),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () => saveJob(job['id']),
                    icon: Icon(
                      isJobSaved(job['id'])
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
