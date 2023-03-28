import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

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
  final AutoScrollController _autoScrollController = AutoScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavBar(
        onSend: (text) {
          _scrollDown();
          _chatViewModel.sendUserMessage(text);
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => CustomAppBar(
                isTyping: _chatViewModel.status.value == Status.loading,
              ),
            ),
            Expanded(
              child: Obx(
                () {
                  _scrollDown();
                  return CustomScrollView(
                    controller: _autoScrollController,
                    slivers: [
                      const SliverToBoxAdapter(
                        child: SizedBox(height: 25),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) => AutoScrollTag(
                            key: ValueKey(index),
                            controller: _autoScrollController,
                            index: index,
                            child: ChatListItem(
                                message:
                                    _chatViewModel.messages.elementAt(index)),
                          ),
                          childCount: _chatViewModel.messages.length,
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _scrollDown() {
    final int index = _chatViewModel.messages.length;
    if (_autoScrollController.hasClients &&
        _autoScrollController.position.maxScrollExtent > 0) {
      _autoScrollController.scrollToIndex(index).then((_) {
        _autoScrollController.highlight(index);
      });
    }
  }
}
