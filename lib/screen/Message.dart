import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Admin, Staff, Renters
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBar: AppBar(
          title: const Text(
            'Chat',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 39, 39, 39),
          centerTitle: true,
          elevation: 0,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Admin'),
              Tab(text: 'Staff'),
              Tab(text: 'Renters'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AdminChatScreen(),
            StaffChatScreen(),
            RentersChatScreen(),
          ],
        ),
      ),
    );
  }
}

class AdminChatScreen extends StatelessWidget {
  const AdminChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChatConversation(
      title: 'Dorm Admin',
      messages: [
        {'sender': 'Admin', 'message': 'Maintenance will be conducted on Friday.'},
        {'sender': 'You', 'message': 'Thanks for the update!'},
      ],
    );
  }
}

class StaffChatScreen extends StatelessWidget {
  const StaffChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChatConversation(
      title: 'Dorm Staff',
      messages: [
        {'sender': 'Staff', 'message': 'Your maintenance request is scheduled.'},
        {'sender': 'You', 'message': 'Thank you!'},
      ],
    );
  }
}

class RentersChatScreen extends StatelessWidget {
  const RentersChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChatConversation(
      title: 'Other Renters',
      messages: [
        {'sender': 'Alex', 'message': 'Anyone free for a group study tonight?'},
        {'sender': 'You', 'message': 'I’m interested! Let’s plan it.'},
      ],
    );
  }
}

class ChatConversation extends StatelessWidget {
  final String title;
  final List<Map<String, String>> messages;

  const ChatConversation({
    Key? key,
    required this.title,
    required this.messages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              final isSender = message['sender'] == 'You';
              return Align(
                alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isSender
                        ? const Color.fromARGB(255, 39, 39, 39)
                        : const Color.fromARGB(255, 24, 24, 24),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${message['sender']}: ${message['message']}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 39, 39, 39),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 24, 24, 24),
                    hintText: 'Type your message...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.send, color: Colors.white),
                onPressed: () {
                  // Handle sending message
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
