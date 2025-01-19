import 'package:flutter/material.dart';
import 'package:project_dormlander/screen/Message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // Notifications/Announcements
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 39, 39, 39),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Announcements',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Dorm maintenance will be conducted on Friday from 9 AM to 3 PM. Please plan accordingly.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'New cleaning schedule has been updated. Check the notice board for details.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Chat Options
            const Text(
              'Chats',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildChatOption(
              context,
              title: 'Dorm Admin',
              subtitle: 'Send queries and suggestions',
              icon: Icons.person,
              onTap: () {
                // Navigate to admin chat screen
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MessageScreen()),
                      );
              },
            ),
            const SizedBox(height: 16),
            _buildChatOption(
              context,
              title: 'Dorm Staff',
              subtitle: 'Request maintenance or support',
              icon: Icons.build,
              onTap: () {
                // Navigate to staff chat screen
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MessageScreen()),
                      );
              },
            ),
            const SizedBox(height: 16),
            _buildChatOption(
              context,
              title: 'Other Renters',
              subtitle: 'Connect and discuss with fellow renters',
              icon: Icons.group,
              onTap: () {
                // Navigate to renters chat screen
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MessageScreen()),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Chat Option Widget
  Widget _buildChatOption(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 39, 39, 39),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              child: Icon(icon, color: Colors.black),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
          ],
        ),
      ),
    );
  }
}
