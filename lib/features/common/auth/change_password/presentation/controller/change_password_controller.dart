import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../core/services/api/api_service.dart';
import '../../../../../../core/config/api/api_end_point.dart';
import '../../../../../../core/utils/app_utils.dart';

class ChangePasswordController extends GetxController {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  ///  change password function

  Future<void> changePasswordRepo() async {
    if (!formKey.currentState!.validate()) return;
    Get.back();
    return;
    isLoading = true;
    update();

    Map<String, String> body = {
      "oldPassword": currentPasswordController.text,
      "newPassword": newPasswordController.text,
    };
    var response = await ApiService.patch(
      ApiEndPoint.changePassword,
      body: body,
    );

    if (response.statusCode == 200) {
      Utils.successSnackBar(response.statusCode.toString(), response.message);

      currentPasswordController.clear();
      newPasswordController.clear();
      confirmPasswordController.clear();

      Get.back();
    } else {
      Get.snackbar(response.statusCode.toString(), response.message, duration: const Duration(seconds: 1));
    }
    isLoading = false;
    update();
  }

  /// dispose Controller
  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
