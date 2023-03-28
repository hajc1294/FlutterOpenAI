import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../viewmodels/chat_view_model.dart';
import '../viewmodels/status.dart';
import '../widgets/chat_list_item.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/custom_app_bar.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatPage> {
  final RxString message = RxString('');
  final ChatViewModel _chatViewModel = ChatViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavBar(
        onSend: (text) => _chatViewModel.sendUserMessage(text),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            Obx(
              () => CustomAppBar(
                isTyping: _chatViewModel.status.value == Status.loading,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 25),
            ),
            Obx(
              () => SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ChatListItem(
                        message: _chatViewModel.messages.elementAt(index));
                  },
                  childCount: _chatViewModel.messages.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
