import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_ai/widgets/custom_bottom_nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../common/strings.dart';
import '../viewmodels/open_ai_view_model.dart';
import '../viewmodels/status.dart';
import '../widgets/custom_app_bar.dart';

class ImageGeneratorPage extends StatefulWidget {
  const ImageGeneratorPage({super.key});

  @override
  State<ImageGeneratorPage> createState() => _ImageGeneratorPageState();
}

class _ImageGeneratorPageState extends State<ImageGeneratorPage> {
  final OpenAIViewModel _openAIViewModel = OpenAIViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavBar(
        onSend: (text) {
          _openAIViewModel.imageGenerator(text);
        },
        inputHint: generateInput,
        iconData: Icons.download,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(onlyWithBackNavigation: true),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: Obx(
                    () {
                      if (_openAIViewModel.status.value == Status.loading) {
                        return _loading();
                      } else {
                        return Visibility(
                          visible: _openAIViewModel.imageUrl.value.isNotEmpty,
                          child:
                              _imageContainer(_openAIViewModel.imageUrl.value),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _loading() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent[400]!),
          ),
          const SizedBox(height: 10),
          const Text(
            loading,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ],
      );

  Center _imageContainer(String url) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(url),
            const SizedBox(height: 20),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                launchUrl(Uri.parse(url));
              },
              child: const Text(
                openBrowser,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      );
}
