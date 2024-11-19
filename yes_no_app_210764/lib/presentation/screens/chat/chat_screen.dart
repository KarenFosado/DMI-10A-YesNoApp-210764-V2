import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_210764/domain/entities/message.dart';
import 'package:yes_no_app_210764/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_210764/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_210764/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_210764/presentation/widgets/chat/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {

  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk_6q6auPu_pWnc7fnFa-aEo7lH1Ouwl9c1ctSct0Jfhwt5PHXa9WvCuNqKNN_EbSeHIc&usqp=CAU'),//
          ),
        ),
        title: const Text('Hola Kity'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final chatProvider = Provider.of<ChatProvider>(context); 

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: 
            ListView.builder(
            controller:  chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder:  (context, index) {
                final message = chatProvider.messageList[index];
                return (message.fromWho == FromWho.hers) 
                   ? HerMessageBubble( message: message,) 
                   : MyMessageBubble(message: message,); 
          
              }),
              ),
            
           
            MessageFieldBox(
              onValue: (value) { chatProvider.sendMessage(value); 
          
              },
            ),
          ],
        ),
      ),
    );
  }
}