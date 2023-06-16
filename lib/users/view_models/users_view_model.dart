import 'dart:async';

import 'package:auth/auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone_2/users/models/user_profile_model.dart';

class UsersViewModel extends AsyncNotifier<UserProfileModel> {
  @override
  FutureOr<UserProfileModel> build() {
    return UserProfileModel.empty();
  }

  Future<void> createAccount(UserCredential credential) async {
    if (credential.user == null) {
      throw Exception('Account not created');
    }
    state = AsyncValue.data(
      UserProfileModel(
        bio: 'undefined',
        link: 'undefined',
        email: credential.user!.email ?? "anon@anon.com",
        uid: credential.user!.uid,
        name: credential.user!.displayName ?? "Anon",
      ),
    );
  }
}

final usersProvider = AsyncNotifierProvider(
  () => UsersViewModel(),
);
