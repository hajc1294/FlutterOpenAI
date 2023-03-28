import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String chatbotAvatarUrl =
    'https://www.softronic.se/wp-content/uploads/2020/03/avatar_chatbot.png';

const String userAvatarUrl =
    'https://d26horl2n8pviu.cloudfront.net/link_data_pictures/images/000/097/343/shared_link/og-avatar-541739b5880b8586eeb033747a8a2cf3e689860d59b506d29a9633aed86d057d.png?1472488132';

const String apiKey = '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';

const List<DeviceOrientation> supportedOrientations = [
  DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown,
];

const SystemUiOverlayStyle defaultStatusBarStyle = SystemUiOverlayStyle(
  statusBarColor: Colors.white,
  statusBarBrightness: Brightness.light,
);