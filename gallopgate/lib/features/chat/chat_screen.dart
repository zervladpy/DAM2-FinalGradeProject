import 'package:flutter/material.dart';
import 'package:gallopgate/features/_common/widgets/appbar/appbar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  static Page<ChatScreen> get page => const MaterialPage(child: ChatScreen());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GAppBar(
        title: Text("Chat"),
      ),
    );
  }
}
