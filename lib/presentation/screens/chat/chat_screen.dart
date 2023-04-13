import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_maybe_23/domain/entities/message.dart';
import 'package:yes_no_maybe_23/presentation/providers/providers.dart';
import 'package:yes_no_maybe_23/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_maybe_23/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_maybe_23/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text('Woman in Red ❤️'),
            leadingWidth: 66,
            toolbarHeight: 80,
            leading: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://image.enjoymovie.net/Gwow5oFKG4KUYp0lWBDf0BCbv5Y=/256x256/smart/core/p/0qWeeo6DWa.jpg'),
                  radius: 28,
                ),
              ],
            )),
        body: _ChatView());
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    //final ScrollController scrollController;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final message = chatProvider.messages[index];
                  return (message.fromWho == FromWho.me)
                      ? MyMessageBubble(msg: message)
                      : HerMessageBubble(msg: message);
                }
              ),
            ),
            const SizedBox(
              height: 20,
            ),
             MessageFieldBox(
              msgEnterIcon: const Icon(Icons.send),
              onValue: (value) => chatProvider.sendMessage(value),
            )
          ],
        ),
      ),
    );
  }
}
