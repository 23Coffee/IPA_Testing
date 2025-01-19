import 'package:flutter/material.dart';
import 'package:project_dormlander/screen/Chat.dart';
import 'package:project_dormlander/screen/Meter.dart';
import 'package:project_dormlander/screen/Payment.dart';
import 'package:project_dormlander/screen/Profile.dart';

void main() {
  runApp(const DormlanderApp());
}

class DormlanderApp extends StatelessWidget {
  const DormlanderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dormlander',
      theme: ThemeData.dark(),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          HomePageContent(),
          MeterUsageScreen(), // Replace with Contract page
          PaymentScreen(), // Replace with Payment page
          ChatScreen(),
          ProfileScreen(), // Replace with Settings page
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.speed),
            label: 'Meter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Payment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Header Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and logo in the same row
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'Welcome to Dormlander',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 16), // Space between text and logo
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 150, // Set the desired width
                        height: 150, // Set the desired height
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/dormlander_logo.png'),
                            fit: BoxFit
                                .cover, // Ensures the image covers the container without distortion
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //const SizedBox(height: 5),
                // Row for Sirasan Place and Room 321
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Image next to Sirasan Place
                    Image.asset(
                      'assets/dormitory.png', // Replace with your image asset path
                      color: Colors.grey,
                      width: 40, // Set the size of the image
                      height: 40,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Sirasan Place',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                //const SizedBox(height: 8),
                // Row for Room 321
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Icon next to Room 321
                    Icon(
                      Icons.bed,
                      color: Colors.grey,
                      size: 40,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Room 321',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 5),

            // Room Owner Details
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/UserIcon.jpg'),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Room Owner: Ramakant Sharma',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Wednesday 6 November 2024\n12:30 PM',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Action Buttons
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildActionButton(
                  'Contract',
                  'assets/sign.png',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Scaffold()),
                    );
                  },
                ),
                _buildActionButton(
                  'Payment',
                  'assets/smartphone.png',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentScreen()),
                    );
                  },
                ),
                _buildActionButton(
                  'Chat',
                  'assets/chat.png',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen()),
                    );
                  },
                ),
                _buildActionButton(
                  'Meter',
                  'assets/speedometer.png',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MeterUsageScreen()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Action Button Helper

  Widget _buildActionButton(
      String title, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap, // Call the function passed as a parameter
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 39, 39, 39),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 60, // Adjust the width of the image
              height: 60, // Adjust the height of the image
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
