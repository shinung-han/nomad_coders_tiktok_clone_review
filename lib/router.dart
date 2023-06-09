import 'package:go_router/go_router.dart';
import 'package:tiktok_clone_2/features/authentication/email_screen.dart';
import 'package:tiktok_clone_2/features/authentication/login_screen.dart';
import 'package:tiktok_clone_2/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone_2/features/authentication/username_screen.dart';
import 'package:tiktok_clone_2/users/user_profile_screen.dart';

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
        builder: (context, state) {
          final args = state.extra as EmailScreenArgs;
          return EmailScreeen(username: args.username);
        }),
    GoRoute(
      path: '/users/:username',
      builder: (context, state) {
        final username = state.params['username'];
        final tab = state.queryParams['show'];
        print(tab);
        return UserProfileScreen(username: username!, tab: tab!);
      },
    ),
  ],
);
