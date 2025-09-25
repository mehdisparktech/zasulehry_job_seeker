import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/text_field/common_text_field.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/cvcreation_pages/presentaion/controller/cv_create_controller.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/component/button/common_button.dart';

class CvCreateScreen extends StatelessWidget {
  CvCreateScreen({Key? key}) : super(key: key);

  final CvCreateController controller = Get.find<CvCreateController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(title: "Add/CV/Resume Creation"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Indicator
            _buildProgressIndicator(),
            SizedBox(height: 24),

            // Dynamic Content Based on Current Step
            Obx(() => _buildStepContent()),

            SizedBox(height: 32),

            // Navigation Buttons
            _buildNavigationButtons(),

            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Obx(() => Row(
      children: [
        _buildProgressStep(0, true), // First step always active (filled)
        _buildProgressLine(true), // First line always active (filled) - as shown in both images
        _buildProgressStep(1, controller.currentStep.value >= 1), // Second step becomes active when step 1
        _buildProgressLine(controller.currentStep.value >= 1), // Second line becomes active when step 1
        _buildProgressStep(2, controller.currentStep.value >= 1), // Third step becomes active when step 1
      ],
    ));
  }

  Widget _buildProgressStep(int stepIndex, bool isActive) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppColors.primaryColor : Colors.grey[300],
      ),
      child: Center(
        child: Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? Colors.white : Colors.grey[500],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressLine(bool isActive) {
    return Expanded(
      child: Container(
        height: 2,
        color: isActive ? AppColors.primaryColor : Colors.grey[300],
      ),
    );
  }

  Widget _buildStepContent() {
    switch (controller.currentStep.value) {
      case 0:
        return _buildStep1Content(); // Personal Information & Profile
      case 1:
        return _buildStep2Content(); // Second step content
      default:
        return _buildStep1Content();
    }
  }

  // STEP 1: Personal Information & Profile - COMPLETE DESIGN
  Widget _buildStep1Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile Image Section
        _buildProfileImageSection(),
        SizedBox(height: 24),

        // Personal Information - COMPLETE SECTION
        _buildPersonalInfoSection(),
      ],
    );
  }

  // STEP 2: Second Step Content - PLACEHOLDER FOR YOUR DESIGN
  Widget _buildStep2Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
              () => _buildDropdownField(
            controller.selectedPersonalInfoType.value,
            controller.personalInfoOptions,
            Icons.keyboard_arrow_down,
            onChanged: (value) => controller.updatePersonalInfoType(value),
          ),
        ),

        SizedBox(height: 16),
        _buildTextField('Job Title :', controller.nameController, 'Enter Job Title'),
        SizedBox(height: 12),
        _buildTextField('Company/Institute Name :', controller.nameController, 'Enter Company Name'),
        SizedBox(height: 12),
        _buildTextField('Location :', controller.nameController, 'Enter Location'),
        SizedBox(height: 12),

        Row(
          children: [
            CommonText(
                text: "Current Working : ",
              color: AppColors.primaryColor,
            ),
            SizedBox(width: 12,),
            CommonButton(
              titleText: "Yes",
              buttonWidth: 60,
              titleSize: 12,
              buttonHeight: 38,
              onTap: (){},
            ),
            SizedBox(width: 8,),
            CommonButton(
              titleText: "No",
              buttonWidth: 60,
              titleSize: 12,
              buttonHeight: 38,
              onTap: (){},
            ),
          ],
        ),
        SizedBox(height: 12,),

           _buildTextField('Date From :', controller.nameController, 'Enter Date From'),
        SizedBox(height: 14,),
        _buildTextField('Date To :', controller.nameController, 'Enter Date To'),
        SizedBox(height: 14,),
        
        CommonText(text: "Work Details"),
        SizedBox(height: 8,),
        CommonTextField(
          hintText: "Enter Work Details",
          maxLines: 3,
        ),
        SizedBox(height: 14,),
        CommonText(text: "Portfolio Url : "),
        SizedBox(height: 12,),
        Obx(
              () => _buildDropdownField(
            controller.portfolioUrl.value,
            controller.personalInfoOptions,
            Icons.keyboard_arrow_down,
            onChanged: (value) => controller.updatePersonalInfoType(value),
          ),
        ),
        SizedBox(height: 12,),
        Align(
          alignment: Alignment.topRight,
          child: CommonButton(
              titleText: "Add More",
            buttonWidth: 150,
            buttonHeight: 38,
            titleSize: 12,
          ),
        ),
        SizedBox(height: 14,),
        Obx(
              () => _buildDropdownField(
            controller.skillActivity.value,
            controller.personalInfoOptions,
            Icons.keyboard_arrow_down,
            onChanged: (value) => controller.updatePersonalInfoType(value),
          ),
        ),
        SizedBox(height: 16,),
        _buildTextField('Skills :', controller.nameController, 'Enter Your Skills'),
        SizedBox(height: 16,),
        _buildTextField('Extra Curricular Activity :', controller.nameController, 'Enter Your Extra Curricular Activity'),
        SizedBox(height: 16,),
        _buildTextField('Hobbies :', controller.nameController, 'Enter Your Hobbies'),
        SizedBox(height: 40,),
        CommonButton(titleText: "Confirm"),

        SizedBox(height: 100), // Temporary spacing for demonstration
      ],
    );
  }

  Widget _buildNavigationButtons() {
    return Obx(() => Row(
      children: [
        // Back Button (only show if not on first step)
        if (controller.currentStep.value > 0)
          Expanded(
            child: CommonButton(
              titleText: 'Back',
              onTap: () => controller.previousStep(),
              // You might want to add a different style for back button
            ),
          ),

        if (controller.currentStep.value > 0) SizedBox(width: 16),

        // Continue/Finish Button
        Expanded(
          flex: controller.currentStep.value > 0 ? 1 : 2,
          child: CommonButton(
            titleText: controller.currentStep.value == 2 ? 'Finish' : 'Continue',
            onTap: () => controller.nextStep(),
          ),
        ),
      ],
    ));
  }

  Widget _buildProfileImageSection() {
    return Center(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment(-0.9, 0),
            end: Alignment(1.0, 0),
            colors: [
              Color(0xFF083E4B),
              Color(0xFF074E5E),
              Color(0xFF0288A6),
            ],
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Obx(
                      () => CircleAvatar(
                    radius: 50,
                    backgroundImage: controller.selectedProfileImage.value != null
                        ? NetworkImage(controller.selectedProfileImage.value!)
                        : AssetImage("assets/images/profile.png") as ImageProvider,
                  ),
                ),
                Positioned(
                  bottom: -8,
                  right: -8,
                  child: IconButton(
                    onPressed: () => controller.pickProfileImage(),
                    icon: Icon(Icons.add_a_photo, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            TextButton(
              onPressed: () => controller.pickProfileImage(),
              child: CommonText(
                text: 'Upload Image',
                fontSize: 14,
                color: AppColors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
              () => _buildDropdownField(
            controller.selectedPersonalInfoType.value,
            controller.personalInfoOptions,
            Icons.keyboard_arrow_down,
            onChanged: (value) => controller.updatePersonalInfoType(value),
          ),
        ),
        SizedBox(height: 16),
        _buildTextField('Name :', controller.nameController, 'Enter Your Name'),
        SizedBox(height: 12),
        _buildTextField('Email :', controller.emailController, 'Enter Your Email'),
        SizedBox(height: 12),
        _buildTextField('Contact Number :', controller.contactController, 'Enter Your Contact Number'),
        SizedBox(height: 12),
        _buildTextField('Your Age :', controller.ageController, 'Enter Your Age'),
        SizedBox(height: 12),
        _buildTextField('Profession :', controller.professionController, 'Enter Your Profession'),
        SizedBox(height: 12),
        _buildTextField('Date Of Birth :', controller.birthDateController, 'Enter Your Date Of Birth', isDate: true),
        SizedBox(height: 12),
        _buildTextField('Permanent Address*', controller.addressController, "Enter Your Permanent Address"),
        SizedBox(height: 12),
        _buildTextField('Present Address*', controller.presentAddressController, "Enter Your Present Address"),
        SizedBox(height: 12),
        CommonText(text: "Driving License"),
        SizedBox(height: 12),
        _buildTaxClassSelection(),
        SizedBox(height: 12),
        CommonText(text: "Buses/Agricultural"),
        SizedBox(height: 12),
        _buildBusSelection(controller),
        SizedBox(height: 12),
        CommonText(text: "Truck"),
        SizedBox(height: 12),
        _buildTrack(controller),
        SizedBox(height: 12),
        CommonText(text: "Languages"),
        SizedBox(height: 12),
        CommonTextField(hintText: "Enter about your self", maxLines: 3),
        SizedBox(height: 12),
        Obx(
              () => _buildDropdownField(
            controller.selectedEducationalInformation.value,
            controller.educationalInfoOption,
            Icons.keyboard_arrow_down,
            onChanged: (value) => controller.updateEducationalInformation(value),
          ),
        ),
        SizedBox(height: 12),
        _buildTextField('Certificate/Exam/Degree :', controller.ageController, 'Enter Your Certificate/Exam/Degree'),
        SizedBox(height: 12),
        _buildTextField('Institute Name :', controller.ageController, 'Enter Your Institute Name'),
        SizedBox(height: 12),
        CommonText(text: "Passing Grade :"),
        SizedBox(height: 12),
        Obx(() => _buildDropdownField(
          controller.selectedGrade.value,
          controller.gradeOptons,
          Icons.keyboard_arrow_down,
          onChanged: (value) => controller.updateGrade(value),
        )),
        SizedBox(height: 12),
        CommonText(text: "Passing Year :"),
        SizedBox(height: 12),
        Obx(() => _buildDropdownField(
          controller.selectedYear.value,
          controller.yearOptions,
          Icons.keyboard_arrow_down,
          onChanged: (value) => controller.updateYear(value),
        )),
      ],
    );
  }

  Widget _buildDropdownField(
      String value,
      List<String> items,
      IconData icon, {
        required Function(String) onChanged,
      }) {
    return GestureDetector(
      onTap: () => _showDropdownModal(items, onChanged),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.transparent,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: AppColors.primaryColor.withOpacity(0.3),
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(value, style: TextStyle(fontSize: 16.sp, color: AppColors.black)),
            Icon(icon, color: Colors.grey, size: 20.w),
          ],
        ),
      ),
    );
  }

  void _showDropdownModal(List<String> items, Function(String) onChanged) {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: items
              .map((item) => ListTile(
            title: Text(item),
            onTap: () {
              onChanged(item);
              Get.back();
            },
          ))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildCertificatesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSectionTitle('Certificates/Licenses*'),
            IconButton(
              onPressed: () => controller.addCertificate(),
              icon: Icon(Icons.add, color: AppColors.primaryColor),
            ),
          ],
        ),
        SizedBox(height: 16),
        _buildTextField('Certificate Name*', controller.certificateNameController, 'Enter Your Certificate Name'),
        SizedBox(height: 12),
        _buildTextField('Organization*', controller.certificateOrgController, "Enter Your Organization"),
        SizedBox(height: 12),
        _buildTextField('Year*', controller.certificateYearController, "Enter Your Year"),
        SizedBox(height: 16),
        Obx(
              () => controller.certificates.isEmpty
              ? SizedBox.shrink()
              : ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.certificates.length,
            itemBuilder: (context, index) {
              final cert = controller.certificates[index];
              return Card(
                margin: EdgeInsets.only(bottom: 8),
                child: ListTile(
                  title: CommonText(text: cert.name, fontSize: 14),
                  subtitle: CommonText(text: cert.organization, fontSize: 12),
                  trailing: IconButton(
                    onPressed: () => controller.removeCertificate(index),
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return CommonText(
      text: title,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    );
  }

  Widget _buildTextField(
      String label,
      TextEditingController textController,
      String hintText, {
        bool isDate = false,
        int maxLines = 1,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: label,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        SizedBox(height: 8),
        CommonTextField(
          controller: textController,
          hintText: hintText,
          maxLines: maxLines,
          suffixIcon: isDate ? Icon(Icons.calendar_today, size: 20, color: Colors.grey[600]) : null,
          onTap: isDate ? () => _showDatePicker(textController) : null,
        ),
      ],
    );
  }

  void _showDatePicker(TextEditingController textController) async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      textController.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  Widget _buildTaxClassSelection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(color: AppColors.primaryColor, width: 2.w),
      ),
      child: Obx(
            () => Row(
          children: controller.taxClassOptions.asMap().entries.map((entry) {
            int index = entry.key;
            String taxClass = entry.value;
            return Expanded(
              child: GestureDetector(
                onTap: () => controller.selectTaxClass(taxClass),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: controller.selectedTaxClass.value == taxClass
                        ? AppColors.primaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: index == 0 ? Radius.circular(23.r) : Radius.zero,
                      bottomLeft: index == 0 ? Radius.circular(23.r) : Radius.zero,
                      topRight: index == (controller.taxClassOptions.length - 1)
                          ? Radius.circular(23.r)
                          : Radius.zero,
                      bottomRight: index == (controller.taxClassOptions.length - 1)
                          ? Radius.circular(23.r)
                          : Radius.zero,
                    ),
                  ),
                  child: Text(
                    taxClass,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: controller.selectedTaxClass.value == taxClass
                          ? AppColors.white
                          : AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildBusSelection(CvCreateController controller) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(color: AppColors.primaryColor, width: 2.w),
        ),
        child: Row(
          children: List.generate(controller.busAgricalrureOptions.length * 2 - 1, (i) {
            if (i.isOdd) {
              return Container(width: 1.w, height: 35.h, color: AppColors.primaryColor);
            }

            int index = i ~/ 2;
            String busClass = controller.busAgricalrureOptions[index];

            return Expanded(
              child: GestureDetector(
                onTap: () => controller.selectedBusAgricalrure.value = busClass,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: controller.selectedBusAgricalrure.value == busClass
                        ? AppColors.primaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: index == 0 ? Radius.circular(23.r) : Radius.zero,
                      bottomLeft: index == 0 ? Radius.circular(23.r) : Radius.zero,
                      topRight: index == controller.busAgricalrureOptions.length - 1
                          ? Radius.circular(23.r)
                          : Radius.zero,
                      bottomRight: index == controller.busAgricalrureOptions.length - 1
                          ? Radius.circular(23.r)
                          : Radius.zero,
                    ),
                  ),
                  child: Text(
                    busClass,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: controller.selectedBusAgricalrure.value == busClass
                          ? AppColors.white
                          : AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      );
    });
  }

  Widget _buildTrack(CvCreateController controller) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(color: AppColors.primaryColor, width: 2.w),
        ),
        child: Row(
          children: List.generate(controller.truckMoney.length * 2 - 1, (i) {
            if (i.isOdd) {
              return Container(width: 1.w, height: 35.h, color: AppColors.primaryColor);
            }

            int index = i ~/ 2;
            String busClass = controller.truckMoney[index];

            return Expanded(
              child: GestureDetector(
                onTap: () => controller.selectedTruckMoney.value = busClass,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: controller.selectedTruckMoney.value == busClass
                        ? AppColors.primaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: index == 0 ? Radius.circular(23.r) : Radius.zero,
                      bottomLeft: index == 0 ? Radius.circular(23.r) : Radius.zero,
                      topRight: index == controller.truckMoney.length - 1
                          ? Radius.circular(23.r)
                          : Radius.zero,
                      bottomRight: index == controller.truckMoney.length - 1
                          ? Radius.circular(23.r)
                          : Radius.zero,
                    ),
                  ),
                  child: Text(
                    busClass,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: controller.selectedTruckMoney.value == busClass
                          ? AppColors.white
                          : AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      );
    });
  }
}