import 'package:flutter/material.dart';
import 'package:yes_no_maybe_23/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_maybe_23/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController =
      ScrollController(); // aqui creamos instancia e controller
  final GetYesNoAnswer getYesNoAnswer =
      GetYesNoAnswer(); // aqui creamos instancia de la clase que tinene el metodo para hacer la peticon http

  List<Message> messages = [
    Message(text: 'Hola amor', fromWho: FromWho.me),
    Message(text: 'Är du hemma?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final Message newTempMsg = Message(
        text: text,
        fromWho: FromWho
            .me); // el fromWho simepre sera me porque siempre sera yo quien este escribiendo
    messages.add(newTempMsg);

    if (text.endsWith('?'))  herReply();

    notifyListeners(); // se renderiza la pantalla con nuevo msg
    moveScrollToBottom(); // hacemos scroll hasta abajo
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messages.add(herMessage);
    notifyListeners(); // se renderiza la pantalla con nuevo msg
    moveScrollToBottom(); //
    print(herMessage);
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(
        milliseconds:
            100)); //hemos puesto este dalay para que pocese bien la animacion y haga el scroll bien hasta ekl final
    chatScrollController.animateTo(
        //chatScrollController.position.maxScrollExtent + 50, //offset(argumento posicional) este no es evidente de sacar
        chatScrollController.position
            .maxScrollExtent, //offset(argumento posicional) este no es evidente de sacar
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut);
  }
}
