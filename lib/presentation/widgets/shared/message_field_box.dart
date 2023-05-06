import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:yes_no_maybe_23/presentation/providers/providers.dart';

class MessageFieldBox extends StatelessWidget {
  final Icon msgEnterIcon;
  // With onValue's property we can extract the String throw a callbak. This property not inserts data but takes out it.
  final ValueChanged<String> onValue; 

  const MessageFieldBox(
      {Key? key, required this.msgEnterIcon, required this.onValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final TextEditingController textController = TextEditingController();
    final FocusNode focusNode = FocusNode();
    //final chatProvider = context.read<ChatProvider>();
    //
    final inputDecoration = InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(40),
        ),
        filled: true,
        suffixIcon: IconButton(
          padding: const EdgeInsets.only(right: 10),
          icon: msgEnterIcon,
          onPressed: () {
            // print('on pressed icon');
            final textValue = textController.value.text;
            // print('send button:$textValue');
            //chatProvider.sendMessage(textValue);
            onValue(textValue);
            textController.clear();
          },
        ),
        hintText: 'End your msg with: ?');
    //
    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      style: const TextStyle(
        fontSize: 24,
      ),
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        // print('submited: $value');
        //chatProvider.sendMessage(value);
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
      onTapOutside: (event) => focusNode.unfocus(),
    );
  }
}
