
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;

  ChatBubble({required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isMe ? Colors.green[100] : Colors.grey[300],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(text),
      ),
    );
  }
}
