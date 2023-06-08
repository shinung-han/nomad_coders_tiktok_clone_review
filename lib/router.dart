import 'package:go_router/go_router.dart';
import 'package:tiktok_clone_2/features/authentication/email_screen.dart';
import 'package:tiktok_clone_2/features/authentication/login_screen.dart';
import 'package:tiktok_clone_2/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone_2/features/authentication/username_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: UsernameScreen.routeName,
      builder: (context, state) => const UsernameScreen(),
    ),
    GoRoute(
      path: EmailScreeen.routeName,
      builder: (context, state) => const EmailScreeen(),
    ),
  ],
);
