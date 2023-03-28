import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String chatbotAvatarUrl =
    'https://static.thenounproject.com/png/2486994-200.png';

const String userAvatarUrl =
    'https://static.thenounproject.com/png/562360-200.png';

const String apiKey = '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';

const List<DeviceOrientation> supportedOrientations = [
  DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown,
];

const SystemUiOverlayStyle defaultStatusBarStyle = SystemUiOverlayStyle(
  statusBarColor: Colors.white,
  statusBarBrightness: Brightness.light,
);
