import 'package:flutter/material.dart';
import 'package:yes_no_app_210764/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {// clase que contiene el widget de la burbuja de mensaje de ella

  //Atributos
  final Message message;// mensaje

  //Contrucutor
  const HerMessageBubble({super.key, required this.message});// inicializa el mensaje

  
  @override
  Widget build(BuildContext context) {// construccion del widget

    final ThemeData theme = Theme.of(context);// tema de la aplicacion

    return Column(// columna que contiene el mensaje
      crossAxisAlignment: CrossAxisAlignment.start,// alineacion del mensaje
      children: [// hijos de la columna
        Container(// contenedor del mensaje
          padding: const EdgeInsets.all(8),// padding del contenedor
          margin: const EdgeInsets.symmetric(vertical: 8),// margen del contenedor
          decoration: BoxDecoration(// decoracion del contenedor
            color: theme.colorScheme.tertiaryContainer , // aplicacion del color secundario
            borderRadius: BorderRadius.circular(20),// bordes redondeados
          ),
          child: Padding(// padding del mensaje
            padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),// padding del mensaje
            child:  Text(// texto del mensaje
              message.text,// mensaje
              style: const TextStyle(color: Color.fromARGB(255, 102, 0, 78)),// estilo del texto
            ),
          ),
        ),

        const SizedBox(height: 5),// espacio entre el mensaje y la imagen

        _ImageBubble( message.imageUrl!), // si hay imagen la muestra

        const SizedBox(height: 10),// espacio entre la imagen y el siguiente mensaje
      ]
    );
  }
}

// Widget que muestra la imagen de la respuesta

class _ImageBubble extends StatelessWidget { // Correspondencia al widget que responde ella 

  final String imageUrl;// imagen de la respuesta

  const _ImageBubble( this.imageUrl);// inicializa la imagen

  @override
  Widget build(BuildContext context) {// construccion del widget
    
    final size = MediaQuery.of(context).size;// tamaño de la pantalla

    return ClipRRect(// recorte redondeado de la imagen
      borderRadius: BorderRadius.circular(20),// bordes redondeados
      child: Image.network(imageUrl,// imagen de la respuesta
      width: size.width * 0.7,// ancho de la imagen
      height: 150,// alto de la imagen
      fit: BoxFit.cover,// ajuste de la imagen
      loadingBuilder: (context, child, loadingProgress) {// constructor de la imagen
        
        if (loadingProgress == null) return child;// si la imagen ya cargo la muestra

        return Container(// contenedor de la imagen
          width: size.width * 0.7,// ancho de la imagen
          height: 150,// alto de la imagen
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),// padding del contenedor
          child: const Text('Londign... Imag'),// texto de carga
        );
      },
      )
    );
  }
}