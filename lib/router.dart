import 'package:go_router/go_router.dart';
import 'package:tiktok_clone_2/common/widgets/main_navigation/main_navigation_screen.dart';
import 'package:tiktok_clone_2/features/authentication/login_screen.dart';
import 'package:tiktok_clone_2/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone_2/features/onboarding/interests_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routeURL,
      builder: (context, state) => const SignUpScreen(),
      routes: const [],
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
  ],
);
