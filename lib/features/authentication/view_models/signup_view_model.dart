import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone_2/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone_2/features/onboarding/interests_screen.dart';
import 'package:tiktok_clone_2/users/view_models/users_view_model.dart';
import 'package:tiktok_clone_2/utils.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp(BuildContext context) async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpForm);
    final users = ref.read(usersProvider.notifier);
    state = await AsyncValue.guard(() async {
      final UserCredential = await _authRepo.emailSignUp(
        form['email'],
        form['password'],
      );

      await users.createAccount(UserCredential);
    });
    if (state.hasError) {
      showFirebaseErrorSnack(context, state.hasError);
    } else {
      context.goNamed(InterestsScreen.routeName);
    }
  }
}

final signUpForm = StateProvider((ref) => {});

final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
