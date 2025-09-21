import 'package:get/get.dart';
import '../../../../../core/utils/enum/enum.dart';

class TermsOfServicesController extends GetxController {
  static TermsOfServicesController get instance => Get.find();
  
  Status status = Status.loading;
  dynamic data = {};
  
  @override
  void onInit() {
    super.onInit();
    geTermsOfServicesRepo();
  }
  
  void geTermsOfServicesRepo() {
    status = Status.loading;
    update();
    
    // Simulate loading terms of services data
    Future.delayed(const Duration(seconds: 1), () {
      data = {'content': '<h1>Terms of Services</h1><p>This is a placeholder terms of services content.</p>'};
      status = Status.completed;
      update();
    });
  }
}