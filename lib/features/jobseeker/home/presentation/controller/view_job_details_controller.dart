import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/utils/enum/enum.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/data/model/job_details_model.dart';
import 'package:zasulehry_job_seeker/core/component/pop_up/job_application_popup.dart';

class ViewJobDetailsController extends GetxController {
  // Observable variables
  var isLoading = false.obs;
  var jobDetails = Rxn<JobDetailsModel>();
  var applyJobStatus = ApplyJobStatus.none.obs;

  // Static instance getter
  static ViewJobDetailsController get instance =>
      Get.put(ViewJobDetailsController());

  @override
  void onInit() {
    super.onInit();
    _initializeJobData();
  }

  /// Initialize job data with sample data
  void _initializeJobData() {
    jobDetails.value = JobDetailsModel.sample();
  }

  /// Set job details from external source
  void setJobDetails(JobDetailsModel job) {
    jobDetails.value = job;
  }

  /// Set apply job status
  void setApplyJobStatus(ApplyJobStatus status) {
    applyJobStatus.value = status;
  }

  /// Handle save job action
  void saveJob() {
    if (applyJobStatus.value == ApplyJobStatus.none) {
      applyJobStatus.value = ApplyJobStatus.saved;
      // TODO: Implement API call to save job
      _showSuccessMessage('Job saved successfully');
    }
  }

  /// Handle apply job action
  void applyJob() {
    if (applyJobStatus.value == ApplyJobStatus.none ||
        applyJobStatus.value == ApplyJobStatus.saved) {
      _showJobApplicationPopup();
    }
  }

  /// Handle cancel application action
  void cancelApplication() {
    if (applyJobStatus.value == ApplyJobStatus.applied ||
        applyJobStatus.value == ApplyJobStatus.pending) {
      applyJobStatus.value = ApplyJobStatus.none;
      // TODO: Implement API call to cancel application
      _showSuccessMessage('Application cancelled');
    }
  }

  /// Handle contact now action
  void contactNow() {
    if (applyJobStatus.value == ApplyJobStatus.approved) {
      // TODO: Implement contact functionality
      _showSuccessMessage('Contacting employer...');
    }
  }

  /// Show job application popup
  void _showJobApplicationPopup() {
    if (jobDetails.value != null) {
      Get.dialog(
        JobApplicationPopup(
          jobTitle: jobDetails.value!.jobTitle,
          companyName: jobDetails.value!.companyName,
        ),
      );
    }
  }

  /// Show success message
  void _showSuccessMessage(String message) {
    Get.snackbar('Success', message, snackPosition: SnackPosition.BOTTOM);
  }

  /// Get button text based on apply status
  String getButtonText() {
    switch (applyJobStatus.value) {
      case ApplyJobStatus.none:
        return 'Apply Now';
      case ApplyJobStatus.applied:
        return 'Cancel';
      case ApplyJobStatus.pending:
        return 'Cancel';
      case ApplyJobStatus.approved:
        return 'Contact Now';
      case ApplyJobStatus.saved:
        return 'Apply Now';
      case ApplyJobStatus.rejected:
        return 'Cancel';
    }
  }

  /// Check if button should have gradient
  bool shouldButtonHaveGradient() {
    return applyJobStatus.value == ApplyJobStatus.approved ||
        applyJobStatus.value == ApplyJobStatus.saved ||
        applyJobStatus.value == ApplyJobStatus.none;
  }

  /// Get button border color based on status
  String getButtonBorderColor() {
    if (applyJobStatus.value == ApplyJobStatus.applied) {
      return 'red';
    } else if (applyJobStatus.value == ApplyJobStatus.approved ||
        applyJobStatus.value == ApplyJobStatus.none ||
        applyJobStatus.value == ApplyJobStatus.saved) {
      return 'primary';
    } else {
      return 'red2';
    }
  }

  /// Get button text color based on status
  String getButtonTextColor() {
    if (applyJobStatus.value == ApplyJobStatus.approved) {
      return 'white';
    } else if (applyJobStatus.value == ApplyJobStatus.none) {
      return 'primary';
    } else if (applyJobStatus.value == ApplyJobStatus.saved) {
      return 'white';
    } else {
      return 'red2';
    }
  }

  /// Handle main button action
  void handleMainButtonAction() {
    switch (applyJobStatus.value) {
      case ApplyJobStatus.none:
        applyJob();
        break;
      case ApplyJobStatus.applied:
        cancelApplication();
        break;
      case ApplyJobStatus.pending:
        cancelApplication();
        break;
      case ApplyJobStatus.approved:
        contactNow();
        break;
      case ApplyJobStatus.saved:
        applyJob();
        break;
      case ApplyJobStatus.rejected:
        // Handle rejected action if needed
        break;
    }
  }

  /// Check if save button should be shown
  bool shouldShowSaveButton() {
    return applyJobStatus.value == ApplyJobStatus.none;
  }

  /// Check if main button should be shown
  bool shouldShowMainButton() {
    return applyJobStatus.value != ApplyJobStatus.rejected;
  }
}
