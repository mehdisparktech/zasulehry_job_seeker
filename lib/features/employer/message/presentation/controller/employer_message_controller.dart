import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/model/employer_message_model.dart';
import '../../data/model/employer_chat_message_model.dart';

// import '../../../../../core/services/api/api_service.dart'; // Uncomment for real API
import '../../../../../core/services/socket/socket_service.dart';
// import '../../../../../core/config/api/api_end_point.dart'; // Uncomment for real API
// import '../../../../../core/utils/app_utils.dart'; // Uncomment for real API
import '../../../../../core/utils/enum/enum.dart';

class MessageController extends GetxController {
  bool isLoading = false;
  bool isMoreLoading = false;
  String? video;

  List messages = [];

  String chatId = "";
  String name = "";

  int page = 1;
  int currentIndex = 0;
  Status status = Status.completed;

  bool isMessage = false;
  bool isInputField = false;

  ScrollController scrollController = ScrollController();
  TextEditingController messageController = TextEditingController();

  static MessageController get instance => Get.put(MessageController());

  MessageModel messageModel = MessageModel.fromJson({});

  Future<void> getMessageRepo() async {
    // Uncomment below code for real API implementation
    // return;
    if (page == 1) {
      messages.clear();
      status = Status.loading;
      update();
    }

    // Demo data for client presentation
    await Future.delayed(
      const Duration(milliseconds: 300),
    ); // Simulate network delay

    if (page == 1) {
      messages.clear();
      // Adding demo message data based on chatId or default messages
      List<ChatMessageModel> demoMessages = _getDemoMessages(chatId);

      for (var message in demoMessages.reversed) {
        messages.add(message);
      }
    }

    page = page + 1;
    status = Status.completed;
    update();

    // Real API implementation (commented out for demo)
    /*
    var response = await ApiService.get(
      "${ApiEndPoint.messages}?chatId=$chatId&page=$page&limit=15",
    );

    if (response.statusCode == 200) {
      var data = response.data['data']['attributes']['messages'];

      for (var messageData in data) {
        messageModel = MessageModel.fromJson(messageData);

        messages.add(
          ChatMessageModel(
            time: messageModel.createdAt.toLocal(),
            text: messageModel.message,
            image: messageModel.sender.image,
            isNotice: messageModel.type == "notice" ? true : false,
            isMe: LocalStorage.userId == messageModel.sender.id ? true : false,
          ),
        );
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

  // Demo messages function
  List<ChatMessageModel> _getDemoMessages(String chatId) {
    switch (chatId) {
      case 'chat_001': // Ahmed Rahman
        return [
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(hours: 1)),
            text:
                "Hello! I saw your job posting for Flutter Developer position.",
            image:
                "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150",
            isMe: false,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(minutes: 58)),
            text:
                "Hi Ahmed! Thanks for your interest. Can you tell me about your experience?",
            image: "",
            isMe: true,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(minutes: 55)),
            text:
                "I have 3 years of experience with Flutter and have built several mobile apps.",
            image:
                "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150",
            isMe: false,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(minutes: 52)),
            text: "That sounds great! Do you have any portfolio I can review?",
            image: "",
            isMe: true,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(minutes: 15)),
            text:
                "Thank you for considering my application. I'm very interested in this position.",
            image:
                "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150",
            isMe: false,
          ),
        ];
      case 'chat_002': // Sarah Khan
        return [
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(hours: 3)),
            text: "Hi! I'm interested in the UI/UX Designer position.",
            image:
                "https://images.unsplash.com/photo-1494790108755-2616b73b0a34?w=150",
            isMe: false,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(
              const Duration(hours: 2, minutes: 30),
            ),
            text:
                "Hello Sarah! Great to hear from you. What's your design background?",
            image: "",
            isMe: true,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(hours: 2)),
            text:
                "Could you please share more details about the job requirements?",
            image:
                "https://images.unsplash.com/photo-1494790108755-2616b73b0a34?w=150",
            isMe: false,
          ),
        ];
      case 'chat_003': // Mohammad Ali
        return [
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(hours: 6)),
            text:
                "Good morning! I'm a senior Flutter developer looking for new opportunities.",
            image:
                "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150",
            isMe: false,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(
              const Duration(hours: 5, minutes: 30),
            ),
            text: "Good morning Mohammad! Tell me more about your experience.",
            image: "",
            isMe: true,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(hours: 5)),
            text: "I have 5 years of experience in Flutter development.",
            image:
                "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150",
            isMe: false,
          ),
        ];
      case 'chat_004': // Fatima Ahmed
        return [
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
            text:
                "Hello! I'm very interested in the marketing coordinator position.",
            image:
                "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150",
            isMe: false,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(days: 1, hours: 1)),
            text:
                "Hi Fatima! Thanks for reaching out. Can you share your marketing experience?",
            image: "",
            isMe: true,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(days: 1)),
            text: "When can we schedule an interview?",
            image:
                "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150",
            isMe: false,
          ),
        ];
      default:
        return [
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(minutes: 30)),
            text: "Hello! How can I help you today?",
            image:
                "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150",
            isMe: false,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(minutes: 25)),
            text:
                "Hi! I'm looking for job opportunities. Do you have any open positions?",
            image: "",
            isMe: true,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(minutes: 20)),
            text:
                "Yes, we have several positions available. What's your area of expertise?",
            image:
                "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150",
            isMe: false,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(minutes: 15)),
            text:
                "I'm a software developer with experience in mobile app development.",
            image: "",
            isMe: true,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(minutes: 10)),
            text: "Perfect! Let me share some relevant positions with you.",
            image:
                "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150",
            isMe: false,
          ),
        ];
    }
  }

  addNewMessage() async {
    isMessage = true;
    update();

    messages.insert(
      0,
      ChatMessageModel(
        time: DateTime.now(),
        text: messageController.text,
        image: "", // LocalStorage.myImage for real implementation
        isMe: true,
      ),

      // ChatMessageModel(
      //     currentTime.format(context).toString(),
      //     controller.messageController.text,
      //     true),
    );

    isMessage = false;
    update();

    // Uncomment below for real implementation
    /*
    var body = {
      "chat": chatId,
      "message": messageController.text,
      "sender": "", // LocalStorage.userId for real implementation
    };
    */

    messageController.clear();

    // Comment out for demo - uncomment for real implementation
    /*
    SocketServices.emitWithAck("add-new-message", body, (data) {
      if (kDebugMode) {
        print(
          "===============================================================> Received acknowledgment: $data",
        );
      }
    });
    */
  }

  listenMessage(String chatId) async {
    SocketServices.on('new-message::$chatId', (data) {
      status = Status.loading;
      update();

      var time = data['createdAt'].toLocal();
      messages.insert(
        0,
        ChatMessageModel(
          isNotice: data['messageType'] == "notice" ? true : false,
          time: time,
          text: data['message'],
          image: data['sender']['image'],
          isMe: false,
        ),
      );

      status = Status.completed;
      update();
    });
  }

  void isEmoji(int index) {
    currentIndex = index;
    isInputField = isInputField;
    update();
  }
}
