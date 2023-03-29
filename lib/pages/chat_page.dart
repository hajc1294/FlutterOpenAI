import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../viewmodels/open_ai_view_model.dart';
import '../viewmodels/status.dart';
import '../widgets/chat_list_item.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/custom_app_bar.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final OpenAIViewModel _openAIViewModel = OpenAIViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavBar(
        onSend: (text) {
          _openAIViewModel.sendUserMessage(text);
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => CustomAppBar(
                isTyping: _openAIViewModel.status.value == Status.loading,
              ),
            ),
            Expanded(
              child: Obx(
                () {
                  return ListView.builder(
                    reverse: true,
                    itemCount: _openAIViewModel.messages.length,
                    itemBuilder: (context, index) {
                      return ChatListItem(
                          message: _openAIViewModel.messages.elementAt(index));
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
