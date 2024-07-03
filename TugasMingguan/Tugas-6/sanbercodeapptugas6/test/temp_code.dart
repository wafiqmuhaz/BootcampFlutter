// class ChatScreen extends StatefulWidget {
//   final String name;

//   ChatScreen({required this.name});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF074E46),
//         title: Text(widget.name),
//         actions: const [
//           Icon(Icons.video_call),
//           SizedBox(width: 10),
//           Icon(Icons.call),
//           SizedBox(width: 10),
//           Icon(Icons.more_vert),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView(
//               children: [
//                 ChatBubble(
//                   text: 'Hello',
//                   isMe: true,
//                 ),
//                 ChatBubble(
//                   text: 'How are you?',
//                   isMe: true,
//                 ),
//                 ChatBubble(
//                   text: 'I am fine, thank you!',
//                   isMe: false,
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Type a message',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30.0),
//                       ),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.send),
//                   onPressed: () {},
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.mic),
//                   onPressed: () {},
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ChatBubble extends StatelessWidget {
//   final String text;
//   final bool isMe;

//   ChatBubble({required this.text, required this.isMe});

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
//         padding: const EdgeInsets.all(10.0),
//         decoration: BoxDecoration(
//           color: isMe ? Colors.green[100] : Colors.grey[300],
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         child: Text(text),
//       ),
//     );
//   }
// }