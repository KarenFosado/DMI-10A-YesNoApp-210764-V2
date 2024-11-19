import 'package:flutter/material.dart';
import 'package:yes_no_app_210764/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {// clase o tipo para los mensajes mios 

  final Message message;// se crea un objeto de tipo mensaje

  // sa agrega el mesaje al constructor
  const MyMessageBubble({super.key, required this.message});// constructor

  @override
  Widget build(BuildContext context) { // construccion del widget
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,// alineacion a la derecha
      children: [
        Container(// contenedor del mensaje
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor, // aplicacion del color primario 
            borderRadius: BorderRadius.circular(20),
          ),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child:  Text(
              message.text, // aqui se agrega el mensaje
              style: const TextStyle(color: Color.fromARGB(255, 166, 18, 100)),
            ),
          ),
        ),

        const SizedBox(height: 10),
      ]
    );
  }
}