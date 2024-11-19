import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final FocusNode focusNode = FocusNode();


final customBorder = UnderlineInputBorder(
  borderSide: const BorderSide(color: Colors.transparent),
  borderRadius: BorderRadius.circular(10),
);

final inputDecoration = InputDecoration(
  hintText: 'Termina el mensaje con un "?"',
    hintStyle: TextStyle(
    color: Colors.black.withOpacity(0.4), 
    fontSize: 16,
  ),
  enabledBorder: customBorder,
  focusedBorder: customBorder,
  filled: true,
  contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10), 
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
        onValue(value); 
      },
    );
  }
}