import 'package:flutter/material.dart';
import 'package:yes_no_app_210764/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {

  
  final Message message;

  const HerMessageBubble({super.key, required this.message});

  
  @override
  Widget build(BuildContext context) {

    final ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: theme.colorScheme.tertiaryContainer , 
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child:  Text(
              message.text,
              style: const TextStyle(color: Color.fromARGB(255, 102, 0, 78)),
            ),
          ),
        ),

        const SizedBox(height: 5),

        _ImageBubble( message.imageUrl!), 

        const SizedBox(height: 10),
      ]
    );
  }
}



class _ImageBubble extends StatelessWidget { 

  final String imageUrl;

  const _ImageBubble( this.imageUrl);

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(imageUrl,
      width: size.width * 0.7,
      height: 150,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        
        if (loadingProgress == null) return child;

        return Container(
          width: size.width * 0.7,
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: const Text('Londign... Imag'),
        );
      },
      )
    );
  }
}