import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/text_field/common_text_field.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/cvcreation_pages/presentaion/controller/cv_create_controller.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/component/button/common_button.dart';
import '../../../../../core/config/route/app_routes.dart';

class CvCreateStep1Screen extends StatelessWidget {
  CvCreateStep1Screen({super.key});

  final CvCreateController controller = Get.find<CvCreateController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(title: "InApp CV/Resume Creation"),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress Indicator
              _buildProgressIndicator(),
              SizedBox(height: 24.h),

              // Step 1 Content
              _buildStep1Content(),

              SizedBox(height: 32.h),

              // Navigation Button
              _buildNavigationButton(),

              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Row(
      children: [
        _buildProgressStep(0, true), // Current step (active)
        _buildProgressLine(true), // Active line
        _buildProgressStep(1, true), // Next step also active
        _buildProgressLine(false), // Inactive line
        _buildProgressStep(2, false), // Final step (inactive)
      ],
    );
  }

  Widget _buildProgressStep(int stepIndex, bool isActive) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppColors.primaryColor : AppColors.blue200,

        gradient: isActive
            ? LinearGradient(
                begin: Alignment(-0.9, 0),
                end: Alignment(1.0, 0),
                colors: [
                  Color(0xFF083E4B),
                  Color(0xFF074E5E),
                  Color(0xFF0288A6),
                ],
              )
            : null,
      ),
      child: Center(
        child: Icon(
          stepIndex == 0 ? Icons.arrow_forward : Icons.check,
          color: Colors.white,
          size: 20.w,
        ),
      ),
    );
  }

  Widget _buildProgressLine(bool isActive) {
    return Expanded(
      child: Container(
        height: 6.h,
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryColor : AppColors.blue200,
          borderRadius: BorderRadius.circular(2.r),
          gradient: isActive
              ? LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFF083E4B),
                    Color(0xFF074E5E),
                    Color(0xFF0288A6),
                  ],
                  stops: [0.0, 0.5, 1.0],
                )
              : null,
        ),
      ),
    );
  }

  Widget _buildStep1Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile Image Section
        _buildProfileImageSection(),
        SizedBox(height: 24.h),

        // Personal Information Section
        _buildPersonalInfoSection(),
      ],
    );
  }

  Widget _buildNavigationButton() {
    return CommonButton(titleText: 'Continue', onTap: () => _navigateToStep2());
  }

  void _navigateToStep2() {
    // Validate step 1 data
    // if (_validateStep1()) {
    //   controller.currentStep.value = 1;
    //   Get.toNamed(AppRoutes.cvCreateStep2);
    // }
    Get.toNamed(AppRoutes.cvCreateStep2);
  }

  // ignore: unused_element
  bool _validateStep1() {
    if (controller.nameController.text.isEmpty) {
      Get.snackbar(
        'Validation Error',
        'Name is required',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 1),
      );
      return false;
    }
    if (controller.emailController.text.isEmpty) {
      Get.snackbar(
        'Validation Error',
        'Email is required',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 1),
      );
      return false;
    }
    return true;
  }

  Widget _buildProfileImageSection() {
    return Center(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: LinearGradient(
            begin: Alignment(-0.9, 0),
            end: Alignment(1.0, 0),
            colors: [Color(0xFF083E4B), Color(0xFF074E5E), Color(0xFF0288A6)],
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Obx(
                  () => CircleAvatar(
                    radius: 50.r,
                    backgroundImage:
                        controller.selectedProfileImage.value != null
                        ? NetworkImage(controller.selectedProfileImage.value!)
                        : AssetImage("assets/images/profile.png")
                              as ImageProvider,
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
            SizedBox(height: 12.h),
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
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColors.transparent,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.backgroundGradient2, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: "Personal Information",
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.backgroundGradient2,
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.backgroundGradient2,
                size: 20.w,
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        _buildTextField('Name :', controller.nameController, 'Enter Your Name'),
        SizedBox(height: 12.h),
        _buildTextField(
          'Email :',
          controller.emailController,
          'Enter Your Email',
        ),
        SizedBox(height: 12.h),
        _buildTextField(
          'Contact Number :',
          controller.contactController,
          'Enter Your Contact Number',
          isNumber: true,
        ),
        SizedBox(height: 12.h),
        _buildTextField(
          'Your Age :',
          controller.ageController,
          'Enter Your Age',
          isNumber: true,
        ),
        SizedBox(height: 12.h),
        _buildTextField(
          'Profession :',
          controller.professionController,
          'Enter Your Profession',
        ),
        SizedBox(height: 12.h),
        _buildTextField(
          'Date Of Birth :',
          controller.birthDateController,
          'Enter Your Date Of Birth',
          isDate: true,
        ),
        SizedBox(height: 12.h),
        _buildTextField(
          'Permanent Address*',
          controller.addressController,
          "Enter Your Permanent Address",
        ),
        SizedBox(height: 12.h),
        _buildTextField(
          'Present Address*',
          controller.presentAddressController,
          "Enter Your Present Address",
        ),
        SizedBox(height: 12.h),
        CommonText(text: "Motorcycles/Cars", fontSize: 16.sp),
        SizedBox(height: 12.h),
        _buildTaxClassSelection(),
        SizedBox(height: 12.h),
        CommonText(text: "Buses/Agricultural", fontSize: 16.sp),
        SizedBox(height: 12.h),
        _buildBusSelection(controller),
        SizedBox(height: 12.h),
        CommonText(text: "Truck"),
        SizedBox(height: 12.h),
        _buildTrack(controller),
        SizedBox(height: 12.h),
        CommonText(text: "About Yourself", fontSize: 16.sp),
        SizedBox(height: 12.h),
        CommonTextField(hintText: "Enter about your self", maxLines: 3),
        SizedBox(height: 20.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColors.transparent,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.backgroundGradient2, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: "Educational Information",
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.backgroundGradient2,
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.backgroundGradient2,
                size: 20.w,
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        _buildTextField(
          'Certificate/Exam/Degree :',
          controller.examController,
          'Enter Your Certificate/Exam/Degree',
        ),
        SizedBox(height: 12.h),
        _buildTextField(
          'Institute Name :',
          controller.institutionNameController,
          'Enter Your Institute Name',
        ),
        SizedBox(height: 12.h),
        CommonText(text: "Passing Grade :"),
        SizedBox(height: 12.h),
        Obx(
          () => _buildDropdownField(
            controller.selectedGrade.value,
            controller.gradeOptons,
            Icons.keyboard_arrow_down,
            onChanged: (value) => controller.updateGrade(value),
          ),
        ),
        SizedBox(height: 12.h),
        CommonText(text: "Passing Year :"),
        SizedBox(height: 12.h),
        Obx(
          () => _buildDropdownField(
            controller.selectedYear.value,
            controller.yearOptions,
            Icons.keyboard_arrow_down,
            onChanged: (value) => controller.updateYear(value),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(
    String value,
    List<String> items,
    IconData icon, {
    required Function(String) onChanged,
  }) {
    // Ensure the current value exists in the items list
    String validValue = items.contains(value) ? value : items.first;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
      decoration: BoxDecoration(
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: validValue,
          isExpanded: true,
          icon: Icon(icon, color: Colors.grey, size: 20.w),
          style: TextStyle(fontSize: 16.sp, color: AppColors.black),
          dropdownColor: Colors.white,
          onChanged: (String? newValue) {
            if (newValue != null) {
              onChanged(newValue);
            }
          },
          items: items.map<DropdownMenuItem<String>>((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController textController,
    String hintText, {
    bool isDate = false,
    int maxLines = 1,
    bool isNumber = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: label,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        SizedBox(height: 8.h),
        CommonTextField(
          controller: textController,
          hintText: hintText,
          maxLines: maxLines,
          keyboardType: isNumber ? TextInputType.phone : TextInputType.text,
          suffixIcon: isDate
              ? Icon(Icons.calendar_today, size: 20, color: Colors.grey[600])
              : null,
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
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          bottomLeft: Radius.circular(25.r),
          topRight: Radius.circular(0.r),
          bottomRight: Radius.circular(0.r),
        ),
        border: Border.all(color: AppColors.primaryColor, width: 2.w),
      ),
      child: Obx(
        () => Row(
          children: List.generate(
            controller.busAgricalrureOptions.length * 2 - 1,
            (i) {
              if (i.isOdd) {
                return Container(
                  width: 1.w,
                  height: 35.h,
                  color: AppColors.primaryColor,
                );
              }

              int index = i ~/ 2;
              String busClass = controller.taxClassOptions[index];
              return Expanded(
                child: GestureDetector(
                  onTap: () => controller.selectTaxClass(busClass),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    decoration: BoxDecoration(
                      color: controller.selectedTaxClass.value == busClass
                          ? AppColors.primaryColor
                          : Colors.transparent,
                      gradient: LinearGradient(
                        colors: [
                          AppColors.backgroundGradient,
                          AppColors.backgroundGradient2,
                          AppColors.backgroundGradient3,
                        ],
                        stops: [0.0, 0.5, 1.0],
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: index == 0
                            ? Radius.circular(23.r)
                            : Radius.zero,
                        bottomLeft: index == 0
                            ? Radius.circular(23.r)
                            : Radius.zero,
                        topRight:
                            index == (controller.taxClassOptions.length - 1)
                            ? Radius.circular(23.r)
                            : Radius.zero,
                        bottomRight:
                            index == (controller.taxClassOptions.length - 1)
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
                        color: controller.selectedTaxClass.value == busClass
                            ? AppColors.white
                            : AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              );
            },

            // children: controller.taxClassOptions.asMap().entries.map((entry) {
            //   int index = entry.key;
            //   String taxClass = entry.value;
            //   return Expanded(
            //     child: GestureDetector(
            //       onTap: () => controller.selectTaxClass(taxClass),
            //       child: Container(
            //         padding: EdgeInsets.symmetric(vertical: 12.h),
            //         decoration: BoxDecoration(
            //           color: controller.selectedTaxClass.value == taxClass
            //               ? AppColors.primaryColor
            //               : Colors.transparent,
            //           gradient: LinearGradient(
            //             colors: [
            //               AppColors.backgroundGradient,
            //               AppColors.backgroundGradient2,
            //               AppColors.backgroundGradient3,
            //             ],
            //             stops: [0.0, 0.5, 1.0],
            //           ),
            //           borderRadius: BorderRadius.only(
            //             topLeft: index == 0 ? Radius.circular(23.r) : Radius.zero,
            //             bottomLeft: index == 0
            //                 ? Radius.circular(23.r)
            //                 : Radius.zero,
            //             topRight: index == (controller.taxClassOptions.length - 1)
            //                 ? Radius.circular(23.r)
            //                 : Radius.zero,
            //             bottomRight:
            //                 index == (controller.taxClassOptions.length - 1)
            //                 ? Radius.circular(23.r)
            //                 : Radius.zero,
            //           ),
            //         ),
            //         child: Text(
            //           taxClass,
            //           textAlign: TextAlign.center,
            //           style: TextStyle(
            //             fontSize: 16.sp,
            //             fontWeight: FontWeight.w500,
            //             color: controller.selectedTaxClass.value == taxClass
            //                 ? AppColors.white
            //                 : AppColors.primaryColor,
            //           ),
            //         ),
            //       ),
            //     ),
            //   );
            // }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildBusSelection(CvCreateController controller) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            bottomLeft: Radius.circular(25.r),
            topRight: Radius.circular(0.r),
            bottomRight: Radius.circular(0.r),
          ),
          border: Border.all(color: AppColors.primaryColor, width: 2.w),
        ),
        child: Row(
          children: List.generate(
            controller.busAgricalrureOptions.length * 2 - 1,
            (i) {
              if (i.isOdd) {
                return Container(
                  width: 1.w,
                  height: 35.h,
                  color: AppColors.primaryColor,
                );
              }

              int index = i ~/ 2;
              String busClass = controller.busAgricalrureOptions[index];

              return Expanded(
                child: GestureDetector(
                  onTap: () =>
                      controller.selectedBusAgricalrure.value = busClass,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    decoration: BoxDecoration(
                      color: controller.selectedBusAgricalrure.value == busClass
                          ? AppColors.primaryColor
                          : Colors.transparent,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF083E4B),
                          Color(0xFF074E5E),
                          Color(0xFF0288A6),
                        ],
                        stops: [0.0, 0.5, 1.0],
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: index == 0
                            ? Radius.circular(23.r)
                            : Radius.zero,
                        bottomLeft: index == 0
                            ? Radius.circular(23.r)
                            : Radius.zero,
                        topRight:
                            index == controller.busAgricalrureOptions.length - 1
                            ? Radius.circular(23.r)
                            : Radius.zero,
                        bottomRight:
                            index == controller.busAgricalrureOptions.length - 1
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
                        color:
                            controller.selectedBusAgricalrure.value == busClass
                            ? AppColors.white
                            : AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }

  Widget _buildTrack(CvCreateController controller) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            bottomLeft: Radius.circular(25.r),
            topRight: Radius.circular(0.r),
            bottomRight: Radius.circular(0.r),
          ),
          border: Border.all(color: AppColors.primaryColor, width: 2.w),
        ),
        child: Row(
          children: List.generate(controller.truckMoney.length * 2 - 1, (i) {
            if (i.isOdd) {
              return Container(
                width: 1.w,
                height: 35.h,
                color: AppColors.primaryColor,
              );
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
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF083E4B),
                        Color(0xFF074E5E),
                        Color(0xFF0288A6),
                      ],
                      stops: [0.0, 0.5, 1.0],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: index == 0 ? Radius.circular(23.r) : Radius.zero,
                      bottomLeft: index == 0
                          ? Radius.circular(23.r)
                          : Radius.zero,
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
