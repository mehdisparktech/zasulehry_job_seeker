import 'package:get/get.dart';

class NotificationController extends GetxController {
  var selectedTab = 0.obs; // 0 for E-mail, 1 for Push Message

  void changeTab(int index) {
    selectedTab.value = index;
  }
}