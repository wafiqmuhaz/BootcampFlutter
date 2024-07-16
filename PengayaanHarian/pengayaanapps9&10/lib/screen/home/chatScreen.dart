import 'package:flutter/material.dart';

import '../../widgets/chatBubble.dart';

class ChatScreen extends StatelessWidget {
  final String name;

  ChatScreen({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF074E46),
        title: Container(
          child: Row(
            children: [
              CircleAvatar(),
              SizedBox(width: 12,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "online",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: const [
          Icon(Icons.video_call),
          SizedBox(width: 10),
          Icon(Icons.call),
          SizedBox(width: 10),
          Icon(Icons.more_vert),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ChatBubble(
                  text: 'Hello',
                  isMe: true,
                ),
                ChatBubble(
                  text: 'Bagaimana kabarmu?',
                  isMe: true,
                ),
                ChatBubble(
                  text: 'Aku baik kok',
                  isMe: false,
                ),
                ChatBubble(
                  text: 'Bagaimana denganmu?',
                  isMe: false,
                ),
                ChatBubble(
                  text: 'Aku baik juga, terimakasih!',
                  isMe: true,
                ),
                ChatBubble(
                  text: 'Apakah kamu ada waktu luang?',
                  isMe: true,
                ),
                ChatBubble(
                  text: 'Saya ingin berbicara denganmu',
                  isMe: true,
                ),
                ChatBubble(
                  text: 'Tentu saja ada!',
                  isMe: false,
                ),
                ChatBubble(
                  text: 'Apa yang ingin anda bicarakan?',
                  isMe: false,
                ),
                ChatBubble(
                  text: 'Sekiranya ada yang dapat saya bantu!',
                  isMe: false,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.mic),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
