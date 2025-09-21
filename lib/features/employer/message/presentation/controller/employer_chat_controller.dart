import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/model/employer_chat_list_model.dart';
// import '../../../../../core/services/api/api_service.dart'; // Uncomment for real API
import '../../../../../core/services/socket/socket_service.dart';
// import '../../../../../core/config/api/api_end_point.dart'; // Uncomment for real API
import '../../../../../core/services/storage/storage_services.dart';
// import '../../../../../core/utils/app_utils.dart'; // Uncomment for real API
import '../../../../../core/utils/enum/enum.dart';

class ChatController extends GetxController {
  /// Api status check here
  Status status = Status.completed;

  /// Chat more Data Loading Bar
  bool isMoreLoading = false;

  /// page no here
  int page = 1;

  /// Chat List here
  List chats = [];

  /// Chat Scroll Controller
  ScrollController scrollController = ScrollController();

  /// Chat Controller Instance create here
  static ChatController get instance => Get.put(ChatController());

  /// Chat More data Loading function
  Future<void> moreChats() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isMoreLoading = true;
      update();
      await getChatRepo();
      isMoreLoading = false;
      update();
    }
  }

  /// Chat data Loading function
  Future<void> getChatRepo() async {
    // Uncomment below code for real API implementation
    // return;
    if (page == 1) {
      status = Status.loading;
      update();
    }

    // Demo data for client presentation
    await Future.delayed(
      const Duration(milliseconds: 500),
    ); // Simulate network delay

    if (page == 1) {
      chats.clear();
      // Adding demo chat data
      List<Map<String, dynamic>> demoChats = [
        {
          "_id": "chat_001",
          "participant": {
            "_id": "user_001",
            "fullName": "Ahmed Rahman",
            "image":
                "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150",
          },
          "latestMessage": {
            "_id": "msg_001",
            "message":
                "Thank you for considering my application. I'm very interested in this position.",
            "createdAt": DateTime.now()
                .subtract(const Duration(minutes: 15))
                .toIso8601String(),
          },
        },
        {
          "_id": "chat_002",
          "participant": {
            "_id": "user_002",
            "fullName": "Sarah Khan",
            "image":
                "https://images.unsplash.com/photo-1494790108755-2616b73b0a34?w=150",
          },
          "latestMessage": {
            "_id": "msg_002",
            "message":
                "Could you please share more details about the job requirements?",
            "createdAt": DateTime.now()
                .subtract(const Duration(hours: 2))
                .toIso8601String(),
          },
        },
        {
          "_id": "chat_003",
          "participant": {
            "_id": "user_003",
            "fullName": "Mohammad Ali",
            "image":
                "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150",
          },
          "latestMessage": {
            "_id": "msg_003",
            "message": "I have 5 years of experience in Flutter development.",
            "createdAt": DateTime.now()
                .subtract(const Duration(hours: 5))
                .toIso8601String(),
          },
        },
        {
          "_id": "chat_004",
          "participant": {
            "_id": "user_004",
            "fullName": "Fatima Ahmed",
            "image":
                "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150",
          },
          "latestMessage": {
            "_id": "msg_004",
            "message": "When can we schedule an interview?",
            "createdAt": DateTime.now()
                .subtract(const Duration(days: 1))
                .toIso8601String(),
          },
        },
        {
          "_id": "chat_005",
          "participant": {
            "_id": "user_005",
            "fullName": "Rashid Hassan",
            "image":
                "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150",
          },
          "latestMessage": {
            "_id": "msg_005",
            "message":
                "I'm available for a quick call to discuss the opportunity.",
            "createdAt": DateTime.now()
                .subtract(const Duration(days: 2))
                .toIso8601String(),
          },
        },
        {
          "_id": "chat_006",
          "participant": {
            "_id": "user_006",
            "fullName": "Nadia Ibrahim",
            "image":
                "https://images.unsplash.com/photo-1544725176-7c40e5a71c5e?w=150",
          },
          "latestMessage": {
            "_id": "msg_006",
            "message":
                "Thank you for reaching out. I'd like to know more about the company culture.",
            "createdAt": DateTime.now()
                .subtract(const Duration(days: 3))
                .toIso8601String(),
          },
        },
      ];

      for (var item in demoChats) {
        chats.add(ChatModel.fromJson(item));
      }
    }

    page = page + 1;
    status = Status.completed;
    update();

    // Real API implementation (commented out for demo)
    /*
    var response = await ApiService.get("${ApiEndPoint.chats}?page=$page");

    if (response.statusCode == 200) {
      var data = response.data['chats'] ?? [];

      for (var item in data) {
        chats.add(ChatModel.fromJson(item));
      }

      page = page + 1;
      status = Status.completed;
      update();
    } else {
      Utils.errorSnackBar(response.statusCode.toString(), response.message);
      status = Status.error;
      update();
    }
    */
  }

  /// Chat data Update  Socket listener
  listenChat() async {
    SocketServices.on("update-chatlist::${LocalStorage.userId}", (data) {
      page = 1;
      chats.clear();

      for (var item in data) {
        chats.add(ChatModel.fromJson(item));
      }

      status = Status.completed;
      update();
    });
  }

  /// Controller on Init¬
  @override
  void onInit() {
    getChatRepo();
    super.onInit();
  }
}
