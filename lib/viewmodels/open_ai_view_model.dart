import 'package:get/get.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

import '../common/constants.dart';
import '../models/message.dart';
import 'status.dart';

class OpenAIViewModel {
  final RxList messages = <Message>[].obs;
  final RxString imageUrl = RxString('');
  final Rx<Status> status = Status.success.obs;
  final OpenAI openAI = OpenAI.instance.build(
    token: apiKey,
    baseOption: HttpSetup(receiveTimeout: const Duration(minutes: 1)),
    isLog: true,
  );

  Future<void> sendUserMessage(String text) async {
    status.value = Status.loading;
    messages.insert(0, Message(text: text));

    final ChatCompleteText chatCompleteText = ChatCompleteText(
      messages: [
        Map.of({'role': 'user', 'content': text})
      ],
      maxToken: 1000,
      model: kChatGptTurbo0301Model,
    );

    final ChatCTResponse? chatCTResponse =
        await openAI.onChatCompletion(request: chatCompleteText).then((value) {
      status.value = Status.success;
      return value;
    }).onError((error, stackTrace) {
      status.value = Status.error;
      return null;
    });

    for (var element in chatCTResponse!.choices) {
      messages.insert(0, Message(text: element.message.content, isBot: true));
    }
  }

  Future<void> imageGenerator(String description) async {
    status.value = Status.loading;

    final GenerateImage generateImage = GenerateImage(description, 1,
        size: ImageSize.size256, responseFormat: Format.url);

    await openAI.generateImage(generateImage).then((value) {
      imageUrl.value = value?.data?.last?.url ?? '';
      status.value = Status.success;
    }).onError((error, stackTrace) {
      status.value = Status.error;
    });
  }
}
