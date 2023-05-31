import 'package:flutter/material.dart';
import 'package:tiktok_clone_2/features/authentication/sign_up_screen.dart';

void main() {
  runApp(
    const TikTokApp(),
  );
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xffe9435a),
        // useMaterial3: true,
      ),
      home: const SignUpScreen(),
    );
  }
}
