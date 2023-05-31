import 'package:flutter/material.dart';
import 'package:tiktok_clone_2/constants/sizes.dart';
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
          scaffoldBackgroundColor: Colors.white,
          primaryColor: const Color(0xffe9435a),
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: Sizes.size16 + Sizes.size2,
              fontWeight: FontWeight.w600,
            ),
          )
          // useMaterial3: true,
          ),
      home: const SignUpScreen(),
    );
  }
}
