import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zasulehry_job_seeker/services/storage/storage_services.dart';
import 'package:zasulehry_job_seeker/utils/enum/enum.dart';

class JobPostingController extends GetxController {
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  // Job Details
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController requirementsController = TextEditingController();
  TextEditingController benefitsController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController salaryMinController = TextEditingController();
  TextEditingController salaryMaxController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();

  // Dropdown selections
  String selectedJobType = "Full-time";
  String selectedExperienceLevel = "Entry Level";
  String selectedEducation = "Bachelor's Degree";

  JobStatus selectedStatus = JobStatus.active;

  List<String> jobTypes = [
    "Full-time",
    "Part-time",
    "Contract",
    "Remote",
    "Hybrid",
  ];
  List<String> experienceLevels = [
    "Entry Level",
    "Mid Level",
    "Senior Level",
    "Executive",
  ];
  List<String> educationLevels = [
    "High School",
    "Bachelor's Degree",
    "Master's Degree",
    "PhD",
  ];

  List<String> selectedSkills = [];
  List<String> availableSkills = [
    "Flutter",
    "Dart",
    "React",
    "JavaScript",
    "TypeScript",
    "Node.js",
    "Python",
    "Java",
    "Swift",
    "Kotlin",
    "PHP",
    "Laravel",
    "Vue.js",
    "Angular",
    "React Native",
    "MongoDB",
    "MySQL",
    "Firebase",
    "AWS",
  ];

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    requirementsController.dispose();
    benefitsController.dispose();
    locationController.dispose();
    departmentController.dispose();
    salaryMinController.dispose();
    salaryMaxController.dispose();
    deadlineController.dispose();
    super.dispose();
  }

  void setJobType(String value) {
    selectedJobType = value;
    update();
  }

  void setExperienceLevel(String value) {
    selectedExperienceLevel = value;
    update();
  }

  void setEducation(String value) {
    selectedEducation = value;
    update();
  }

  void setJobStatus(JobStatus status) {
    selectedStatus = status;
    update();
  }

  void toggleSkill(String skill) {
    if (selectedSkills.contains(skill)) {
      selectedSkills.remove(skill);
    } else {
      selectedSkills.add(skill);
    }
    update();
  }

  Future<void> selectDeadline() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now().add(const Duration(days: 30)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      deadlineController.text = "${picked.day}/${picked.month}/${picked.year}";
      update();
    }
  }

  Future<void> postJob() async {
    if (!formKey.currentState!.validate()) return;

    if (selectedSkills.isEmpty) {
      Get.snackbar("Error", "Please select at least one skill");
      return;
    }

    isLoading = true;
    update();

    try {
      // ignore: unused_local_variable
      Map<String, dynamic> jobData = {
        "title": titleController.text,
        "description": descriptionController.text,
        "requirements": requirementsController.text,
        "benefits": benefitsController.text,
        "location": locationController.text,
        "department": departmentController.text,
        "jobType": selectedJobType,
        "experienceLevel": selectedExperienceLevel,
        "education": selectedEducation,
        "salaryMin": int.tryParse(salaryMinController.text) ?? 0,
        "salaryMax": int.tryParse(salaryMaxController.text) ?? 0,
        "skills": selectedSkills,
        "deadline": deadlineController.text,
        "status": selectedStatus.name,
        "employerId": LocalStorage.userId,
      };

      // Uncomment when API is ready
      // var response = await ApiService.post(
      //   "${ApiEndPoint.baseUrl}/jobs",
      //   body: jobData,
      // );

      // if (response.statusCode == 200) {
      //   Get.snackbar("Success", "Job posted successfully!");
      //   Get.back();
      //   _clearForm();
      // } else {
      //   Get.snackbar("Error", response.message);
      // }

      // Mock success for now
      await Future.delayed(const Duration(seconds: 2));
      Get.snackbar("Success", "Job posted successfully!");
      Get.back();
      _clearForm();
    } catch (e) {
      Get.snackbar("Error", "Failed to post job: $e");
    }

    isLoading = false;
    update();
  }

  void _clearForm() {
    titleController.clear();
    descriptionController.clear();
    requirementsController.clear();
    benefitsController.clear();
    locationController.clear();
    departmentController.clear();
    salaryMinController.clear();
    salaryMaxController.clear();
    deadlineController.clear();
    selectedSkills.clear();
    selectedJobType = "Full-time";
    selectedExperienceLevel = "Entry Level";
    selectedEducation = "Bachelor's Degree";
    selectedStatus = JobStatus.active;
  }

  void saveDraft() {
    // Save as draft functionality
    Get.snackbar("Info", "Draft saved successfully!");
  }
}
