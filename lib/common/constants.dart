import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String apiKey = 'YOUR API KEY';

const List<DeviceOrientation> supportedOrientations = [
  DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown,
];

const SystemUiOverlayStyle defaultStatusBarStyle = SystemUiOverlayStyle(
  statusBarColor: Colors.white,
  statusBarBrightness: Brightness.light,
);
