# open_ai

![](https://camo.githubusercontent.com/4cfe18471a1e04d323974c7ff4e71b9ea2308d32a660d7b5c9b7f895e9d8e05f/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f446172742d3031373543323f7374796c653d666f722d7468652d6261646765266c6f676f3d64617274266c6f676f436f6c6f723d7768697465)

Simple implementation of chat and image generator using OpenAI.

## Getting Started

To run this project follow these steps:

1. Clone it.
2. Open in terminal and run ```flutter pub get```.
3. Go to https://platform.openai.com/account/api-keys and generate your own API KEY, if youu don't have an account, you must create one.
4. Copy and paste your API KEY in constants.dart file.
5. Run the project ```flutter run```.

If you want to know more about the implementation, you can check the following links:

- [OpenAI](https://platform.openai.com/docs/introduction/overview)
- [Flutter ChatGPT SDK](https://pub.dev/packages/chat_gpt_sdk)
- [ChatGPT SDK repository](https://github.com/redevRx/Flutter-ChatGPT)

Another packages used in the project:

- [GetX](https://pub.dev/packages/get)
- [Url Launcher](https://pub.dev/packages/url_launcher)

About the implementation:

- The app implements the MVVM design pattern, and a structure similar to what is specified for Clean Code.
- It uses reactive programming (GetX) for event and state handling.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
