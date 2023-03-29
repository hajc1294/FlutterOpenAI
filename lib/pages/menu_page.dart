import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/strings.dart';
import '../resources/assets_name.dart';
import 'chat_page.dart';
import 'image_generator_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 230,
                child: Image.asset(AssetsName.logo),
              ),
              const SizedBox(height: 80),
              _buttonNavigation(
                '$test $chatGPT',
                _navigate(context, const ChatPage()),
                containerColor: Colors.greenAccent[400]!,
              ),
              const SizedBox(height: 20),
              _buttonNavigation(
                imageGenerator,
                _navigate(context, const ImageGeneratorPage()),
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  CupertinoButton _buttonNavigation(
    String text,
    Function onPressed, {
    Color textColor = Colors.black,
    Color containerColor = Colors.black,
  }) =>
      CupertinoButton(
        padding: EdgeInsets.zero,
        child: Container(
          width: 300,
          height: 60,
          decoration: _buttonDecoration(containerColor),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        onPressed: () => onPressed(),
      );

  BoxDecoration _buttonDecoration(Color color) => BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      );

  Function _navigate(BuildContext context, StatefulWidget page) => () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      };
}
