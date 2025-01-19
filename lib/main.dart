import 'package:flutter/material.dart';
import 'package:project_dormlander/screen/Message.dart';
import 'package:project_dormlander/screen/Meter.dart';
import 'package:project_dormlander/screen/MeterChart.dart';
import 'package:project_dormlander/screen/Payment.dart';
import 'package:project_dormlander/screen/Login.dart';
import 'package:project_dormlander/screen/Chat.dart';
import 'screen/Home.dart';
import 'screen/Login.dart';
import 'screen/Profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login', // Set the initial route
      routes: {
        '/': (context) => const DormlanderApp(), // Home screen as the default
        '/login': (context) =>
            const LoginScreen(), // Route for SigninOrSignupScreen
        '/profile': (context) => const ProfileScreen(),
        '/meter': (context) => const MeterUsageScreen(),
        '/meterchart': (context) => const UsageChartScreen(),
        '/payment': (context) => const PaymentScreen(),
        '/chat': (context) => const ChatScreen(),
        '/message': (context) => const MessageScreen(),
      },
    );
  }
}
