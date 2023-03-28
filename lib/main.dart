import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'common/constants.dart';
import 'pages/chat_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(defaultStatusBarStyle);
    SystemChrome.setPreferredOrientations(supportedOrientations);

    return const MaterialApp(
      home: ChatPage(),
    );
  }
}
