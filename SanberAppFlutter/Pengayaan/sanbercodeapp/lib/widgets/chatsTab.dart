import 'package:flutter/material.dart';

import '../screen/chatScreen.dart';

class ChatsTab extends StatelessWidget {
  final List<String> names = [
    'Adam',
    'Lex',
    'Alex',
    'Marco',
    'Ben',
    'Linda',
    'Ora',
    'Frank',
    'Adam',
    'Lex',
    'Alex',
    'Marco',
    'Ben',
    'Linda',
    'Ora',
    'Frank',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: names.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(),
          trailing: const Text("12/05/2022"),
          title: Text(names[index]),
          subtitle: const Text('Lorem ipsum dolor sit amet'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatScreen(name: names[index])),
            );
          },
        );
      },
    );
  }
}
