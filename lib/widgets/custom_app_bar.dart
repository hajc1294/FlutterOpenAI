import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/strings.dart';
import '../resources/assets_name.dart';

class CustomAppBar extends StatelessWidget {
  final bool isTyping;
  final bool onlyWithBackNavigation;

  const CustomAppBar({
    super.key,
    this.isTyping = false,
    this.onlyWithBackNavigation = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      decoration: _appBarDecoration(),
      child: Row(
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          if (!onlyWithBackNavigation) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: 35,
                child: Image.asset(AssetsName.chatBotAvatar),
              ),
            ),
            const SizedBox(width: 5),
            _statusText(),
          ] else ...[
            const SizedBox(width: 10),
            const Text(
              image,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ],
      ),
    );
  }

  BoxDecoration _appBarDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            offset: const Offset(0, 10),
            blurRadius: 10,
          )
        ],
      );

  Column _statusText() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            chatGPT,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            isTyping ? typing : online,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      );
}
