import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/regester_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'LoginPage': (context) => LoginPage(),
      RegisterPage.id:(context) => RegisterPage(),
      },
      initialRoute: 'LoginPage',
    );
  }
}
