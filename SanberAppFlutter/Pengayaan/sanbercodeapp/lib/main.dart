import 'package:flutter/material.dart';

import 'screen/auth/login_screen.dart';
import 'screen/home/homeScreen.dart';

void main() async {
  runApp(const MyApp());
}

//Whatsapp Clone
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'WhatsApp Clone',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: LoginScreen(),
//     );
//   }
// }

//Telegram Clone // Tugas 5 Selasa 2 Juli 2024
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telegram Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TeleScreen(),
    );
  }
}

class TeleScreen extends StatefulWidget {
  const TeleScreen({super.key});

  @override
  _TeleScreenState createState() => _TeleScreenState();
}

class _TeleScreenState extends State<TeleScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const ChatListScreen(),
    const Center(child: Text('Contacts')),
    const Center(child: Text('Calls')),
    const SettingsScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('Wafiq Muhaz'),
              accountEmail: Text('wafiqmuhaz@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/1.jpeg'),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    'W',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile User'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: () {
                // Navigate to Notifications Screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Privacy'),
              onTap: () {
                // Navigate to Privacy Screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help'),
              onTap: () {
                // Navigate to Help Screen
              },
            ),
          ],
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: const Color.fromARGB(255, 226, 226, 226),
            primaryColor: const Color.fromARGB(255, 231, 231, 231),
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: const TextStyle(color: Colors.yellow))),
        child: BottomNavigationBar(
          elevation: 2,
          fixedColor: Colors.black,
          backgroundColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
              ),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              label: 'Contacts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Calls',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChatItem(
            images: "assets/images/1.jpeg",
            name: 'Boris',
            lastMessage: 'Sticker',
            time: '4:30 PM'),
        ChatItem(
            images: "assets/images/2.jpeg",
            name: 'Arthur',
            lastMessage: 'This software is easy to open',
            time: '4:30 PM'),
        ChatItem(
            images: "assets/images/3.jpeg",
            name: 'Maldives',
            lastMessage: 'David: I have been using soft...',
            time: '4:30 PM'),
        ChatItem(
            images: "assets/images/1.jpeg",
            name: 'Racing',
            lastMessage: 'Mazda Lovers Sarah: I have...',
            time: '4:30 PM'),
        ChatItem(
            images: "assets/images/2.jpeg",
            name: 'Albert',
            lastMessage: 'Hello',
            time: '4:30 PM'),
        ChatItem(
            images: "assets/images/3.jpeg",
            name: 'Bernadette',
            lastMessage: 'Voice message',
            time: '4:30 PM'),
        ChatItem(
            images: "assets/images/1.jpeg",
            name: 'Rudolph',
            lastMessage: 'Say hi to Alice',
            time: '4:30 PM'),
        ChatItem(
            images: "assets/images/2.jpeg",
            name: 'Boris',
            lastMessage: 'Sticker',
            time: '4:30 PM'),
        ChatItem(
            images: "assets/images/3.jpeg",
            name: 'Arthur',
            lastMessage: 'This software is easy to open',
            time: '4:30 PM'),
        ChatItem(
            images: "assets/images/1.jpeg",
            name: 'Maldives',
            lastMessage: 'David: I have been using soft...',
            time: '4:30 PM'),
        ChatItem(
            images: "assets/images/2.jpeg",
            name: 'Racing',
            lastMessage: 'Mazda Lovers Sarah: I have...',
            time: '4:30 PM'),
        ChatItem(
            images: "assets/images/3.jpeg",
            name: 'Albert',
            lastMessage: 'Hello',
            time: '4:30 PM'),
        ChatItem(
            images: "assets/images/1.jpeg",
            name: 'Bernadette',
            lastMessage: 'Voice message',
            time: '4:30 PM'),
        ChatItem(
            images: "assets/images/2.jpeg",
            name: 'Rudolph',
            lastMessage: 'Say hi to Alice',
            time: '4:30 PM'),
        ChatItem(
            images: "assets/images/3.jpeg",
            name: 'Boris',
            lastMessage: 'Sticker',
            time: '4:30 PM'),
        ChatItem(
            images: "assets/images/1.jpeg",
            name: 'Arthur',
            lastMessage: 'This software is easy to open',
            time: '4:30 PM'),
        ChatItem(
            images: "assets/images/2.jpeg",
            name: 'Maldives',
            lastMessage: 'David: I have been using soft...',
            time: '4:30 PM'),
        ChatItem(
            images: "assets/images/3.jpeg",
            name: 'Racing',
            lastMessage: 'Mazda Lovers Sarah: I have...',
            time: '4:30 PM'),
        ChatItem(
            images: "assets/images/1.jpeg",
            name: 'Albert',
            lastMessage: 'Hello',
            time: '4:30 PM'),
        ChatItem(
            images: "assets/images/2.jpeg",
            name: 'Bernadette',
            lastMessage: 'Voice message',
            time: '4:30 PM'),
        ChatItem(
            images: "assets/images/3.jpeg",
            name: 'Rudolph',
            lastMessage: 'Say hi to Alice',
            time: '4:30 PM'),
      ],
    );
  }
}

class ChatItem extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String time;
  final String images;

  ChatItem(
      {super.key,
      required this.name,
      required this.images,
      required this.lastMessage,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(images),
      ),
      title: Text(name),
      subtitle: Text(lastMessage),
      trailing: Text(time),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen(name: name)),
        );
      },
    );
  }
}

class ChatScreen extends StatelessWidget {
  final String name;

  ChatScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/1.jpeg'),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                const Text(
                  'online',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ChatBubble(
                  isMe: false,
                  text: 'What do you think?',
                  time: '8:43 AM',
                  imageUrl: 'assets/images/2.jpeg',
                ),
                ChatBubble(
                  isMe: true,
                  text: 'Oh yes this looks great!',
                  time: '8:45 AM',
                ),
                ChatBubble(
                  isMe: false,
                  text: '',
                  time: '8:46 AM',
                  imageUrl: 'assets/images/1.jpeg',
                ),
                ChatBubble(
                  isMe: true,
                  text: '',
                  time: '8:50 AM',
                  voiceMessage: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
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

class ChatBubble extends StatelessWidget {
  final bool isMe;
  final String text;
  final String time;
  final String? imageUrl;
  final bool voiceMessage;

  ChatBubble({
    super.key,
    required this.isMe,
    required this.text,
    required this.time,
    this.imageUrl,
    this.voiceMessage = false,
  });

  @override
  Widget build(BuildContext context) {
    final alignment = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final borderRadius = isMe
        ? const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          )
        : const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          if (imageUrl != null)
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                image: DecorationImage(
                  image: AssetImage(imageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          if (text.isNotEmpty)
            Container(
              decoration: BoxDecoration(
                color: isMe ? Colors.blue : Colors.grey[300],
                borderRadius: borderRadius,
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black,
                ),
              ),
            ),
          if (voiceMessage)
            Container(
              decoration: BoxDecoration(
                color: isMe ? Colors.blue : Colors.grey[300],
                borderRadius: borderRadius,
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.play_arrow,
                      color: isMe ? Colors.white : Colors.black),
                  const SizedBox(width: 5),
                  Text(
                    '0:05',
                    style: TextStyle(color: isMe ? Colors.white : Colors.black),
                  ),
                ],
              ),
            ),
          Text(time, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 22.0, right: 22.0),
        child: ListView(
          children: [
            ListTile(
              tileColor: Colors.grey,
              leading: const Icon(Icons.person),
              title: const Text('Profile User'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()),
                );
              },
            ),
            const SizedBox(
              height: 12,
            ),
            const ListTile(
              tileColor: Colors.grey,
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
            ),
            const SizedBox(
              height: 12,
            ),
            const ListTile(
              tileColor: Colors.grey,
              leading: Icon(Icons.lock),
              title: Text('Privacy'),
            ),
            const SizedBox(
              height: 12,
            ),
            const ListTile(
              tileColor: Colors.grey,
              leading: Icon(Icons.help),
              title: Text('Help'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 120,
                backgroundImage: AssetImage('assets/images/1.jpeg'),
              ),
              SizedBox(height: 20),
              Text(
                'Wafiq Muhaz',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'wafiqmuhaz@gmail.com',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 5),
              Text('08995258',
                  style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
            ],
          ),
        ),
      ),
    );
  }
}
