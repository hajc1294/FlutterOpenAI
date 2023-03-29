import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String apiKey = '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';

const List<DeviceOrientation> supportedOrientations = [
  DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown,
];

const SystemUiOverlayStyle defaultStatusBarStyle = SystemUiOverlayStyle(
  statusBarColor: Colors.white,
  statusBarBrightness: Brightness.light,
);
