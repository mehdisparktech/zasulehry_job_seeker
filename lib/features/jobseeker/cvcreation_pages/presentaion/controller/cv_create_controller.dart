import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CvCreateController extends GetxController {
  // Text Controllers
  final nameController = TextEditingController();
  final professionController = TextEditingController();
  final emailController = TextEditingController();
  final contactController = TextEditingController();
  final ageController = TextEditingController();
  final birthDateController = TextEditingController();
  final addressController = TextEditingController();
  final presentAddressController = TextEditingController();

  // Work Experience Controllers
  final jobTitleController = TextEditingController();
  final companyController = TextEditingController();
  final locationController = TextEditingController();
  final workFromController = TextEditingController();
  final workToController = TextEditingController();

  // Skills Controllers
  final skillsController = TextEditingController();

  // Education Controllers
  final institutionController = TextEditingController();
  final degreeController = TextEditingController();
  final fieldController = TextEditingController();
  final educationFromController = TextEditingController();
  final educationToController = TextEditingController();

  // Certificate Controllers
  final certificateNameController = TextEditingController();
  final certificateOrgController = TextEditingController();
  final certificateYearController = TextEditingController();

  // Observable variables
  final selectedProfileImage = Rx<String?>(null);
  final workExperiences = <WorkExperience>[].obs;
  final skills = <String>[].obs;
  final educationList = <Education>[].obs;
  final certificates = <Certificate>[].obs;

  // Reactive selections
  final selectedTaxClass = "".obs;
  final selectedBusAgricalrure = "".obs;
  final selectedTruckMoney = "".obs;
  final selectedLanguages = <String>[].obs;
  final selectedSkillLevels = <String, String>{}.obs;
  final selectedPersonalInfoType = "Personal Information".obs;
  final portfolioUrl = "Url:kdjkdjdf".obs;
  final skillActivity = "Skill/Activity".obs;
  final selectWordExperience = "Work Experience".obs;
  final selectedEducationalInformation = "Educational Information".obs;
  final selectedGrade = "A Grade".obs;
  final selectedYear = "2022".obs;

  // Options
  final List<String> taxClassOptions = ["Am", "A1", "A2", "C1", "E1"];
  final List<String> busAgricalrureOptions = ["C1", "CI1", "C2e", "C2", "E2"];
  final List<String> truckMoney = ["C1", "CI1", "C2", "E2"];
  final List<String> languageOptions = [
    'English',
    'Spanish',
    'French',
    'German',
    'Arabic',
    'Urdu',
  ];
  final List<String> skillLevelOptions = [
    'Beginner',
    'Intermediate',
    'Advanced',
    'Expert',
  ];
  final List<String> personalInfoOptions = [
    "Personal Information",
    "Professional Information",
  ];
  final List<String> educationalInfoOption = [
    "Personal Information",
    "Professional Information",
  ];
  final List<String> gradeOptons = [
    "Personal Information",
    "Professional Information",
  ];
  final List<String> yearOptions = [
    "Personal Information",
    "Professional Information",
  ];

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    nameController.text = 'Muhammad Raiz';
    professionController.text = '';
    emailController.text = '';
    contactController.text = '';
    selectedTaxClass.value = taxClassOptions.first;
    selectedBusAgricalrure.value = busAgricalrureOptions.first;
    selectedTruckMoney.value = truckMoney.first;
  }

  final currentStep = 0.obs;

  // Navigation methods for 2-step process
  void nextStep() {
    if (currentStep.value < 1) {
      // Only 2 steps (0 and 1)
      // Validate current step before moving to next
      if (_validateCurrentStep()) {
        currentStep.value++;
        Get.snackbar(
          'Progress',
          'Moving to step ${currentStep.value + 1}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      // Final step - save/submit
      saveResume();
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }

  // Reset step when starting CV creation
  void resetStep() {
    currentStep.value = 0;
  }

  bool _validateCurrentStep() {
    switch (currentStep.value) {
      case 0: // Personal Information validation
        if (nameController.text.isEmpty) {
          //Get.snackbar('Error', 'Name is required');
          return true;
        }
        if (emailController.text.isEmpty) {
          //Get.snackbar('Error', 'Email is required');
          return true;
        }
        return true;
      case 1: // Step 2 validation
        // Add your step 2 validation here when you design it
        return true;
      default:
        return true;
    }
  }

  // Profile Image
  Future<void> pickProfileImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 80,
      );
      if (image != null) {
        selectedProfileImage.value = image.path;
        Get.snackbar('Success', 'Profile image selected successfully!');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  void updatePersonalInfoType(String type) {
    selectedPersonalInfoType.value = type;
  }

  void updateEducationalInformation(String type) {
    selectedEducationalInformation.value = type;
  }

  void selectTaxClass(String taxClass) {
    selectedTaxClass.value = taxClass;
  }

  void updateGrade(String taxClass) {
    selectedGrade.value = taxClass;
  }

  void updateYear(String taxClass) {
    selectedYear.value = taxClass;
  }

  void selectBusAgricalrure(String bus) {
    selectedBusAgricalrure.value = bus;
  }

  void selectTruck(String bus) {
    selectedTruckMoney.value = bus;
  }

  // Work Experience Methods
  void addWorkExperience() {
    if (jobTitleController.text.isNotEmpty &&
        companyController.text.isNotEmpty) {
      workExperiences.add(
        WorkExperience(
          jobTitle: jobTitleController.text,
          company: companyController.text,
          location: locationController.text,
          fromDate: workFromController.text,
          toDate: workToController.text,
        ),
      );
      clearWorkExperienceFields();
      Get.snackbar('Success', 'Work experience added successfully!');
    } else {
      Get.snackbar('Error', 'Please fill in required fields');
    }
  }

  void removeWorkExperience(int index) {
    if (index >= 0 && index < workExperiences.length) {
      workExperiences.removeAt(index);
      Get.snackbar('Success', 'Work experience removed successfully!');
    }
  }

  void clearWorkExperienceFields() {
    jobTitleController.clear();
    companyController.clear();
    locationController.clear();
    workFromController.clear();
    workToController.clear();
  }

  // Skills Methods
  void addSkill() {
    String skillText = skillsController.text.trim();
    if (skillText.isNotEmpty && !skills.contains(skillText)) {
      skills.add(skillText);
      skillsController.clear();
      Get.snackbar('Success', 'Skill added successfully!');
    } else if (skills.contains(skillText)) {
      Get.snackbar('Warning', 'Skill already exists');
    } else {
      Get.snackbar('Error', 'Please enter a skill');
    }
  }

  void removeSkill(int index) {
    if (index >= 0 && index < skills.length) {
      skills.removeAt(index);
      Get.snackbar('Success', 'Skill removed successfully!');
    }
  }

  // Education Methods
  void addEducation() {
    if (institutionController.text.isNotEmpty &&
        degreeController.text.isNotEmpty) {
      educationList.add(
        Education(
          institution: institutionController.text,
          degree: degreeController.text,
          field: fieldController.text,
          fromDate: educationFromController.text,
          toDate: educationToController.text,
        ),
      );
      clearEducationFields();
      Get.snackbar('Success', 'Education added successfully!');
    } else {
      Get.snackbar('Error', 'Please fill in required fields');
    }
  }

  void removeEducation(int index) {
    if (index >= 0 && index < educationList.length) {
      educationList.removeAt(index);
      Get.snackbar('Success', 'Education removed successfully!');
    }
  }

  void clearEducationFields() {
    institutionController.clear();
    degreeController.clear();
    fieldController.clear();
    educationFromController.clear();
    educationToController.clear();
  }

  // Certificate Methods
  void addCertificate() {
    if (certificateNameController.text.isNotEmpty) {
      certificates.add(
        Certificate(
          name: certificateNameController.text,
          organization: certificateOrgController.text,
          year: certificateYearController.text,
        ),
      );
      clearCertificateFields();
      Get.snackbar('Success', 'Certificate added successfully!');
    } else {
      Get.snackbar('Error', 'Please enter certificate name');
    }
  }

  void removeCertificate(int index) {
    if (index >= 0 && index < certificates.length) {
      certificates.removeAt(index);
      Get.snackbar('Success', 'Certificate removed successfully!');
    }
  }

  void clearCertificateFields() {
    certificateNameController.clear();
    certificateOrgController.clear();
    certificateYearController.clear();
  }

  // Language Methods
  void toggleLanguage(String language) {
    if (selectedLanguages.contains(language)) {
      selectedLanguages.remove(language);
    } else {
      selectedLanguages.add(language);
    }
  }

  void updateSkillLevel(String skill, String level) {
    selectedSkillLevels[skill] = level;
  }

  // Form Validation & Save
  bool validateForm() {
    if (nameController.text.isEmpty) {
      Get.snackbar('Error', 'Name is required');
      return false;
    }
    if (emailController.text.isEmpty) {
      Get.snackbar('Error', 'Email is required');
      return false;
    }
    if (contactController.text.isEmpty) {
      Get.snackbar('Error', 'Contact number is required');
      return false;
    }
    return true;
  }

  void saveResume() {
    if (validateForm()) {
      Get.snackbar(
        'Success',
        'Resume saved successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void resetForm() {
    nameController.clear();
    professionController.clear();
    emailController.clear();
    contactController.clear();
    ageController.clear();
    birthDateController.clear();
    addressController.clear();
    presentAddressController.clear();

    clearWorkExperienceFields();
    workExperiences.clear();

    skillsController.clear();
    skills.clear();

    clearEducationFields();
    educationList.clear();

    clearCertificateFields();
    certificates.clear();

    selectedProfileImage.value = null;
    selectedTaxClass.value = taxClassOptions.first;
    selectedBusAgricalrure.value = busAgricalrureOptions.first;
    selectedLanguages.clear();
    selectedSkillLevels.clear();
    selectedPersonalInfoType.value = personalInfoOptions.first;
    currentStep.value = 0; // Reset to step 0
  }

  @override
  void onClose() {
    nameController.dispose();
    professionController.dispose();
    emailController.dispose();
    contactController.dispose();
    ageController.dispose();
    birthDateController.dispose();
    addressController.dispose();
    presentAddressController.dispose();
    jobTitleController.dispose();
    companyController.dispose();
    locationController.dispose();
    workFromController.dispose();
    workToController.dispose();
    skillsController.dispose();
    institutionController.dispose();
    degreeController.dispose();
    fieldController.dispose();
    educationFromController.dispose();
    educationToController.dispose();
    certificateNameController.dispose();
    certificateOrgController.dispose();
    certificateYearController.dispose();
    super.onClose();
  }
}

// Data Models
class WorkExperience {
  final String jobTitle;
  final String company;
  final String location;
  final String fromDate;
  final String toDate;

  WorkExperience({
    required this.jobTitle,
    required this.company,
    required this.location,
    required this.fromDate,
    required this.toDate,
  });
}

class Education {
  final String institution;
  final String degree;
  final String field;
  final String fromDate;
  final String toDate;

  Education({
    required this.institution,
    required this.degree,
    required this.field,
    required this.fromDate,
    required this.toDate,
  });
}

class Certificate {
  final String name;
  final String organization;
  final String year;

  Certificate({
    required this.name,
    required this.organization,
    required this.year,
  });
}
