import 'package:flutter/material.dart';
import 'package:gallopgate/features/chat/widgets/chat_appbar.dart';
import 'package:gallopgate/features/chat/widgets/chat_card.dart';
import 'package:gallopgate/utils/constraints/_constraints_library.dart';
import 'package:gallopgate/utils/helper/helper.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  static Page<ChatScreen> get page => const MaterialPage(child: ChatScreen());

  @override
  Widget build(BuildContext context) {
    List<ChatCard> chats = const [
      ChatCard(),
      ChatCard(),
      ChatCard(),
      ChatCard(),
      ChatCard(),
      ChatCard(),
      ChatCard(),
      ChatCard(),
      ChatCard(),
      ChatCard(),
      ChatCard(),
      ChatCard(),
    ];
    bool isDarkMode = GHelper.isDarkMode(context);

    return Scaffold(
      appBar: const ChatAppbar(),
      body: Padding(
          padding: EdgeInsets.all(GSizes.separationSm),
          child: ListView.separated(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              return chats[index];
            },
            separatorBuilder: (BuildContext context, int index) {
              if (index == chats.length) return const SizedBox();
              return Divider(
                height: 0.8,
                color: (isDarkMode
                        ? GColor.lightBackground
                        : GColor.darkBackground)
                    .withOpacity(.1),
              );
            },
          )),
    );
  }
}
