import 'package:flutter/material.dart';
import 'package:yes_no_app_210764/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {

  final Message message;

  
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) { 
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(// contenedor del mensaje
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor, 
            borderRadius: BorderRadius.circular(20),
          ),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child:  Text(
              message.text, 
              style: const TextStyle(color: Color.fromARGB(255, 166, 18, 100)),
            ),
          ),
        ),

        const SizedBox(height: 10),
      ]
    );
  }
}