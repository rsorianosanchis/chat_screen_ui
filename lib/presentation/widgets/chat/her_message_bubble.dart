import 'package:flutter/material.dart';
import 'package:yes_no_maybe_23/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message msg;
  const HerMessageBubble({Key? key, required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // print(screenSize.width);
    final themeColors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            constraints: BoxConstraints(maxWidth: screenSize.width * 0.65),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: themeColors.tertiaryContainer,
                borderRadius: BorderRadius.circular(20)),
            child: Text(msg.text)),
        const SizedBox(
          height: 10,
        ),
        Container(
            height: 150,
            constraints: BoxConstraints(
                maxWidth: screenSize.width * 0.65, maxHeight: 150),
            child:(msg.imageUrl != null)
              ? _ImageBubble(imgUrl: msg.imageUrl!)
              :null
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imgUrl;

  const _ImageBubble({super.key,required this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imgUrl,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
