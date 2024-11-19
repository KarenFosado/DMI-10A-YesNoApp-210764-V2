import 'package:flutter/material.dart';
import 'package:yes_no_app_210764/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app_210764/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola Kitty!', fromWho: FromWho.me),
    Message(text: 'Estas Durmiendo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async { 
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      herReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async { 
    await Future.delayed(const Duration(milliseconds: 100));// espera 100 milisegundos

    chatScrollController.animateTo(// animacion para mover el scroll
        chatScrollController.position.maxScrollExtent,// maximo scroll
        duration: const Duration(milliseconds: 100),// duracion de la animacion
        curve: Curves.easeOut);// curva de la animacion
  }
}