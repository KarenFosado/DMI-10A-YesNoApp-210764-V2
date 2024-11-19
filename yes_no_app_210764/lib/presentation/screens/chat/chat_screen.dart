import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_210764/domain/entities/message.dart';
import 'package:yes_no_app_210764/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_210764/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_210764/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_210764/presentation/widgets/chat/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {// pantalla de chat

  const ChatScreen({Key? key}) : super(key: key);// constructor

  @override
  Widget build(BuildContext context) {// construccion de la pantalla


    return Scaffold(// se crea un scaffold
      appBar: AppBar(// se crea un appbar
        
        leading: const Padding(// se agrega un padding
          padding: EdgeInsets.all(4.0),// padding
          child: CircleAvatar(// se crea un avatar
            backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk_6q6auPu_pWnc7fnFa-aEo7lH1Ouwl9c1ctSct0Jfhwt5PHXa9WvCuNqKNN_EbSeHIc&usqp=CAU'),//
          ),
        ),
        title: const Text('Hola Kity'),// titulo
        centerTitle: false,// alineacion del titulo
      ),
      body: _ChatView(),// cuerpo de la pantalla
    );
  }
}

class _ChatView extends StatelessWidget {// vista del chat

  @override
  Widget build(BuildContext context) {// construccion de la vista

    final chatProvider = Provider.of<ChatProvider>(context); // se obtiene el provider

    return SafeArea(// se crea un area segura
      child: Padding(// se agrega un padding
        padding: const EdgeInsets.symmetric(horizontal: 10),// padding
        child: Column(// se crea una columna
          children: [
            Expanded(child: // se crea un area expandida
            ListView.builder(// Lista de mensajes
            controller:  chatProvider.chatScrollController,// controlador del scroll
              itemCount: chatProvider.messageList.length,// cantidad de mensajes
              itemBuilder:  (context, index) {// se crea un item de la lista
                final message = chatProvider.messageList[index];
                return (message.fromWho == FromWho.hers) // si es de ella
                   ? HerMessageBubble( message: message,) // si es de ella
                   : MyMessageBubble(message: message,); // si es mio
          
              }),
              ),
            
            // Campo de texto de mensaje
            MessageFieldBox(// caja de mensaje
              onValue: (value) { chatProvider.sendMessage(value); // Envia el mensaje
              //  onValue: chatProvider.sendMessage, // Envia el mensaje
              },
            ),
          ],
        ),
      ),
    );
  }
}