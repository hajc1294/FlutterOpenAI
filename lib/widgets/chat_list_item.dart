import 'package:flutter/material.dart';

import '../common/constants.dart';
import '../models/message.dart';
import '../resources/assets_name.dart';

class ChatListItem extends StatelessWidget {
  final Message message;

  const ChatListItem({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: message.isBot ? 40 : 10,
          left: message.isBot ? 10 : 40,
          bottom: 25),
      child: Stack(
        alignment: message.isBot
            ? AlignmentDirectional.topStart
            : AlignmentDirectional.topEnd,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: _itemDecoration(message.isBot),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: message.isBot
                  ? _createRow(message.isBot)
                  : _createRow(message.isBot).reversed.toList(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _createRow(bool isBot) => List.of([
        SizedBox(
          width: 15,
          child: Image.asset(
              isBot ? AssetsName.chatBotAvatar : AssetsName.userAvatar),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            message.text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(width: 10),
      ]);

  BoxDecoration _itemDecoration(bool isBot) => BoxDecoration(
        color: isBot ? Colors.white : Colors.greenAccent[400],
        borderRadius: BorderRadius.only(
          topRight: const Radius.circular(15),
          topLeft: const Radius.circular(15),
          bottomRight: Radius.circular(isBot ? 15 : 0),
          bottomLeft: Radius.circular(isBot ? 0 : 15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.25),
            offset: const Offset(0, 0),
            blurRadius: 10,
          )
        ],
      );
}
