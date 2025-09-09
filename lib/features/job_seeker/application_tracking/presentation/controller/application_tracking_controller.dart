import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/services/storage/storage_services.dart';

class ApplicationTrackingController extends GetxController {
  bool isLoading = false;

  List applications = [];
  List filteredApplications = [];

  String selectedFilter = "All";
  List<String> statusFilters = [
    "All",
    "Applied",
    "Under Review",
    "Interview Scheduled",
    "Shortlisted",
    "Hired",
    "Rejected",
  ];

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
      // var response = await ApiService.get("${ApiEndPoint.baseUrl}/user/applications");
      // if (response.statusCode == 200) {
      //   applications = response.data['data'] ?? [];
      // }

      // Mock data for now
      applications = [
        {
          "id": "1",
          "jobId": "j1",
          "jobTitle": "Senior Flutter Developer",
          "company": "Tech Solutions Ltd",
          "companyLogo": "https://via.placeholder.com/50",
          "appliedDate": "2024-01-15",
          "status": "Under Review",
          "location": "Dhaka, Bangladesh",
          "salary": "৳80,000 - ৳120,000",
          "type": "Full-time",
          "applicationNumber": "APP-2024-001",
          "lastUpdated": "2024-01-16",
          "notes":
              "Application submitted successfully. HR will review within 3-5 business days.",
          "interviewDate": null,
          "feedback": null,
          "nextStep": "Wait for HR review",
          "timeline": [
            {
              "status": "Applied",
              "date": "2024-01-15",
              "description": "Application submitted successfully",
            },
            {
              "status": "Under Review",
              "date": "2024-01-16",
              "description": "Application is being reviewed by HR team",
            },
          ],
        },
        {
          "id": "2",
          "jobId": "j2",
          "jobTitle": "Mobile App Developer",
          "company": "Digital Innovations",
          "companyLogo": "https://via.placeholder.com/50",
          "appliedDate": "2024-01-10",
          "status": "Interview Scheduled",
          "location": "Remote",
          "salary": "৳50,000 - ৳80,000",
          "type": "Remote",
          "applicationNumber": "APP-2024-002",
          "lastUpdated": "2024-01-12",
          "notes":
              "Interview scheduled for January 20th at 2:00 PM via Google Meet.",
          "interviewDate": "2024-01-20 14:00",
          "feedback": null,
          "nextStep": "Prepare for technical interview",
          "timeline": [
            {
              "status": "Applied",
              "date": "2024-01-10",
              "description": "Application submitted successfully",
            },
            {
              "status": "Under Review",
              "date": "2024-01-11",
              "description": "Application reviewed by HR",
            },
            {
              "status": "Interview Scheduled",
              "date": "2024-01-12",
              "description": "Technical interview scheduled for January 20th",
            },
          ],
        },
        {
          "id": "3",
          "jobId": "j3",
          "jobTitle": "UI/UX Designer",
          "company": "Creative Studio",
          "companyLogo": "https://via.placeholder.com/50",
          "appliedDate": "2024-01-05",
          "status": "Rejected",
          "location": "Dhaka, Bangladesh",
          "salary": "৳40,000 - ৳70,000",
          "type": "Full-time",
          "applicationNumber": "APP-2024-003",
          "lastUpdated": "2024-01-08",
          "notes":
              "Thank you for your interest. We have decided to move forward with another candidate.",
          "interviewDate": null,
          "feedback":
              "While your portfolio shows promise, we were looking for someone with more experience in user research.",
          "nextStep": null,
          "timeline": [
            {
              "status": "Applied",
              "date": "2024-01-05",
              "description": "Application submitted successfully",
            },
            {
              "status": "Under Review",
              "date": "2024-01-06",
              "description": "Application reviewed by design team",
            },
            {
              "status": "Rejected",
              "date": "2024-01-08",
              "description": "Application not selected for further process",
            },
          ],
        },
        {
          "id": "4",
          "jobId": "j4",
          "jobTitle": "Backend Developer",
          "company": "StartupXYZ",
          "companyLogo": "https://via.placeholder.com/50",
          "appliedDate": "2024-01-12",
          "status": "Shortlisted",
          "location": "Chittagong, Bangladesh",
          "salary": "৳60,000 - ৳90,000",
          "type": "Full-time",
          "applicationNumber": "APP-2024-004",
          "lastUpdated": "2024-01-14",
          "notes":
              "Congratulations! You have been shortlisted for the final round.",
          "interviewDate": "2024-01-22 10:00",
          "feedback": "Great technical skills demonstrated in the coding test.",
          "nextStep": "Final interview with CTO",
          "timeline": [
            {
              "status": "Applied",
              "date": "2024-01-12",
              "description": "Application submitted successfully",
            },
            {
              "status": "Under Review",
              "date": "2024-01-13",
              "description": "Application reviewed",
            },
            {
              "status": "Interview Scheduled",
              "date": "2024-01-13",
              "description": "Initial interview completed",
            },
            {
              "status": "Shortlisted",
              "date": "2024-01-14",
              "description": "Selected for final round",
            },
          ],
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

    update();
  }

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'applied':
        return Colors.blue;
      case 'under review':
        return Colors.orange;
      case 'interview scheduled':
        return Colors.purple;
      case 'shortlisted':
        return Colors.green;
      case 'hired':
        return Colors.teal;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  void viewApplicationDetails(String applicationId) {
    final application = applications.firstWhere(
      (app) => app['id'] == applicationId,
    );
    _showApplicationDetailsDialog(application);
  }

  void _showApplicationDetailsDialog(Map application) {
    Get.dialog(
      Dialog(
        child: Container(
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(maxHeight: 600, maxWidth: 400),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Header
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        application['jobTitle'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                Text(
                  application['company'],
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),

                const SizedBox(height: 16),

                /// Status
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: getStatusColor(
                      application['status'],
                    ).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    application['status'],
                    style: TextStyle(
                      fontSize: 12,
                      color: getStatusColor(application['status']),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                /// Application Info
                _buildInfoRow(
                  "Application Number",
                  application['applicationNumber'],
                ),
                _buildInfoRow("Applied Date", application['appliedDate']),
                _buildInfoRow("Last Updated", application['lastUpdated']),
                if (application['interviewDate'] != null)
                  _buildInfoRow("Interview Date", application['interviewDate']),

                const SizedBox(height: 16),

                /// Notes
                if (application['notes'] != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Notes:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(application['notes']),
                      const SizedBox(height: 16),
                    ],
                  ),

                /// Feedback
                if (application['feedback'] != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Feedback:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(application['feedback']),
                      const SizedBox(height: 16),
                    ],
                  ),

                /// Next Step
                if (application['nextStep'] != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Next Step:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(application['nextStep']),
                      const SizedBox(height: 16),
                    ],
                  ),

                /// Timeline
                const Text(
                  "Application Timeline:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ...((application['timeline'] as List?) ?? []).map((step) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(top: 4, right: 8),
                          decoration: BoxDecoration(
                            color: getStatusColor(step['status']),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                step['status'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                step['date'],
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                step['description'],
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              "$label:",
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  void withdrawApplication(String applicationId) {
    // Show confirmation dialog first
    Get.dialog(
      AlertDialog(
        title: const Text("Withdraw Application"),
        content: const Text(
          "Are you sure you want to withdraw this application?",
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text("Cancel")),
          TextButton(
            onPressed: () {
              Get.back();
              _performWithdraw(applicationId);
            },
            child: const Text("Withdraw"),
          ),
        ],
      ),
    );
  }

  void _performWithdraw(String applicationId) {
    // Add actual API call here
    // var response = await ApiService.delete("${ApiEndPoint.baseUrl}/applications/$applicationId");

    // Mock withdrawal for now
    int index = applications.indexWhere((app) => app['id'] == applicationId);
    if (index != -1) {
      applications[index]['status'] = 'Withdrawn';
      filterApplications(selectedFilter);
      Get.snackbar("Success", "Application withdrawn successfully");
    }
  }

  int get totalApplications => applications.length;
  int get pendingApplications => applications
      .where(
        (app) => app['status'] == 'Applied' || app['status'] == 'Under Review',
      )
      .length;
  int get interviewsScheduled => applications
      .where((app) => app['status'] == 'Interview Scheduled')
      .length;
  int get successfulApplications => applications
      .where(
        (app) => app['status'] == 'Hired' || app['status'] == 'Shortlisted',
      )
      .length;
}
