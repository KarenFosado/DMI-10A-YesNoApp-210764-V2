import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final FocusNode focusNode = FocusNode();

// ignore: non_constant_identifier_names
final customBorder = UnderlineInputBorder(
  borderSide: const BorderSide(color: Colors.transparent),
  borderRadius: BorderRadius.circular(10),
);

final inputDecoration = InputDecoration(
  hintText: 'Termina tu mensaje con un "?"',
    hintStyle: TextStyle(
    color: Colors.black.withOpacity(0.4), // Ajusta la opacidad aquí
    fontSize: 16,
  ),
  enabledBorder: customBorder,
  focusedBorder: customBorder,
  filled: true,
  contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10), // Ajusta el relleno aquí
  suffixIcon: IconButton(
    icon: const Icon(Icons.send_outlined),
    onPressed: () {
      final textValue = textController.value.text;
      textController.clear();
      onValue(textValue);
    },
  ),
);
    
    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        onValue(value); // Envia el mensaje o 
      },
    );
  }
}