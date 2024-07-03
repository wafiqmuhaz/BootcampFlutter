import 'package:flutter/material.dart';

import '../../widgets/callsTab.dart';
import '../../widgets/chatsTab.dart';
import '../../widgets/statusTab.dart';
import 'chatScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: const Drawer(
          backgroundColor: Colors.white,
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xFF074E46),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'CHATS'),
              Tab(text: 'STATUS'),
              Tab(text: 'CALLS'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ChatsTab(),
            StatusTab(),
            CallsTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          backgroundColor: const Color(0xFF04CB3F),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatScreen(
                        name: "Wafiq Muhaz",
                      )),
            );
          },
          child: const Icon(Icons.message, color: Colors.white,),
        ),
      ),
    );
  }
}
