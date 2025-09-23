import 'package:get/get.dart';

class JobSeekerHomeController extends GetxController {
  // Observable variables
  var isLoading = false.obs;
  var searchQuery = ''.obs;
  var selectedLocation = ''.obs;
  var jobCount = 20.obs;

  // Filter related variables
  var category = Rxn<String>();
  var subCategory = Rxn<String>();
  var employmentType = 'Full Time'.obs;
  var experience = 'With Experience'.obs;
  var salaryTypeIndex = 1.obs; // 0=Hourly,1=Monthly,2=Yearly
  var salary = 50.0.obs;
  var distance = 10.0.obs;

  // Static data lists
  final List<String> categories = ['Category', 'IT', 'Marketing', 'Design'];

  final List<String> subCategories = [
    'Sub Category',
    'Frontend',
    'Backend',
    'UI/UX',
  ];

  final List<String> employmentTypes = ['Full Time', 'Part Time', 'Contract'];

  final List<String> experiences = ['With Experience', 'Fresher'];

  @override
  void onInit() {
    super.onInit();
    _initializeData();
  }

  void _initializeData() {
    // Initialize any default data here
  }

  // Search functionality
  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void updateLocation(String location) {
    selectedLocation.value = location;
  }

  // Filter methods
  void updateCategory(String? value) {
    category.value = value;
  }

  void updateSubCategory(String? value) {
    subCategory.value = value;
  }

  void updateEmploymentType(String value) {
    employmentType.value = value;
  }

  void updateExperience(String value) {
    experience.value = value;
  }

  void updateSalaryType(int index) {
    salaryTypeIndex.value = index;
  }

  void updateSalary(double value) {
    salary.value = value;
  }

  void updateDistance(double value) {
    distance.value = value;
  }

  // Business logic methods
  void applyFilters() {
    // Implement filter application logic here
    // This could involve API calls or local filtering
    _performSearch();
  }

  void _performSearch() {
    isLoading.value = true;

    // Simulate API call or data processing
    Future.delayed(const Duration(seconds: 1), () {
      // Update job count based on filters
      _updateJobCount();
      isLoading.value = false;
    });
  }

  void _updateJobCount() {
    // Simple logic to update job count based on filters
    int baseCount = 20;

    if (category.value != null && category.value != 'Category') {
      baseCount += 5;
    }

    if (employmentType.value != 'Full Time') {
      baseCount -= 3;
    }

    jobCount.value = baseCount;
  }

  void clearFilters() {
    category.value = null;
    subCategory.value = null;
    employmentType.value = 'Full Time';
    experience.value = 'With Experience';
    salaryTypeIndex.value = 1;
    salary.value = 50.0;
    distance.value = 10.0;
    _performSearch();
  }

  // Get formatted salary text
  String get salaryTypeText {
    switch (salaryTypeIndex.value) {
      case 0:
        return 'Hourly';
      case 1:
        return 'Monthly';
      case 2:
        return 'Yearly';
      default:
        return 'Monthly';
    }
  }

  // Get salary range text
  String get salaryRangeText {
    final minSalary = (salary.value - 10).toStringAsFixed(0);
    final maxSalary = (salary.value + 10).toStringAsFixed(0);
    return '\$$minSalary-\$$maxSalary/$salaryTypeText';
  }

  // Get distance text
  String get distanceText {
    return '${distance.value.toStringAsFixed(0)}km';
  }
}
