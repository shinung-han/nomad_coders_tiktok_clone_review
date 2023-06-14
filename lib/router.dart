import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone_2/common/widgets/main_navigation/main_navigation_screen.dart';
import 'package:tiktok_clone_2/features/authentication/login_screen.dart';
import 'package:tiktok_clone_2/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone_2/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone_2/features/discover/activity_screen.dart';
import 'package:tiktok_clone_2/features/inbox/chat_detail_screen.dart';
import 'package:tiktok_clone_2/features/inbox/chats_screen.dart';
import 'package:tiktok_clone_2/features/onboarding/interests_screen.dart';
import 'package:tiktok_clone_2/features/videos/views/video_recording_screen.dart';

final routerProvider = Provider(
  (ref) {
    ref.watch(authStateStream);
    return GoRouter(
      initialLocation: '/home',
      redirect: (context, state) {
        final isLoggedIn = ref.read(authRepo).isLoggedIn;
        if (!isLoggedIn) {
          if (state.subloc != SignUpScreen.routeURL &&
              state.subloc != LoginScreen.routeURL) {
            return SignUpScreen.routeURL;
          }
        }

        return null;
      },
      routes: [
        GoRoute(
          name: SignUpScreen.routeName,
          path: SignUpScreen.routeURL,
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          name: LoginScreen.routeName,
          path: LoginScreen.routeURL,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          name: InterestsScreen.routeName,
          path: InterestsScreen.routeURL,
          builder: (context, state) => const InterestsScreen(),
        ),
        GoRoute(
          path: '/:tab(home|discover|inbox|profile)',
          name: MainNavigationScreen.routeName,
          builder: (context, state) {
            final tab = state.params['tab']!;

            return MainNavigationScreen(tab: tab);
          },
        ),
        GoRoute(
          path: ActivityScreen.routeURL,
          name: ActivityScreen.routeName,
          builder: (context, state) => const ActivityScreen(),
        ),
        GoRoute(
          path: ChatsScreen.routeURL,
          name: ChatsScreen.routeName,
          builder: (context, state) => const ChatsScreen(),
          routes: [
            GoRoute(
              path: ChatDetailScreen.routeURL,
              name: ChatDetailScreen.routeName,
              builder: (context, state) {
                final chatId = state.params['chatId']!;
                return ChatDetailScreen(
                  chatId: chatId,
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: VideoRecordingScreen.routeURL,
          name: VideoRecordingScreen.routeName,
          pageBuilder: (context, state) => CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 150),
            child: const VideoRecordingScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final position =
                  Tween(begin: const Offset(0, 1), end: Offset.zero)
                      .animate(animation);
              return SlideTransition(
                position: position,
                child: child,
              );
            },
          ),
        ),
      ],
    );
  },
);
