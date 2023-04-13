import 'package:flutter/material.dart';
import 'package:yes_no_maybe_23/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message msg;
  const MyMessageBubble({Key? key, required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // print(screenSize.width);
    final themeColors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
            constraints: BoxConstraints(maxWidth: screenSize.width * 0.65),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: themeColors.primaryContainer,
                borderRadius: BorderRadius.circular(20)),
            child:  Text(msg.text)),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
