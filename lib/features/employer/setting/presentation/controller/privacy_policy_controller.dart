import 'package:get/get.dart';
import '../../../../../core/utils/enum/enum.dart';

class PrivacyPolicyController extends GetxController {
  static PrivacyPolicyController get instance => Get.find();
  
  Status status = Status.loading;
  dynamic data = {};
  
  @override
  void onInit() {
    super.onInit();
    getPrivacyPolicyRepo();
  }
  
  void getPrivacyPolicyRepo() {
    status = Status.loading;
    update();
    
    // Simulate loading privacy policy data
    Future.delayed(const Duration(seconds: 1), () {
      data = {'content': '<h1>Privacy Policy</h1><p>This is a placeholder privacy policy content.</p>'};
      status = Status.completed;
      update();
    });
  }
}