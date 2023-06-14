import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone_2/constants/breakpoints.dart';
import 'package:tiktok_clone_2/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone_2/features/videos/view_models/playback_config_vm.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: SizedBox(
        width: Breakpoints.sm,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
          ),
          body: ListView(
            children: [
              SwitchListTile.adaptive(
                value: ref.watch(playbackConfigProvider).muted,
                onChanged: (value) {
                  ref.read(playbackConfigProvider.notifier).setMuted(value);
                },
                title: const Text('Mute video'),
                subtitle: const Text('Video wil lbe muted by default'),
              ),
              SwitchListTile.adaptive(
                value: ref.watch(playbackConfigProvider).autoplay,
                onChanged: (value) {
                  ref.read(playbackConfigProvider.notifier).setAutoplay(value);
                },
                title: const Text('Auto play'),
                subtitle: const Text('Video will start playing automatically'),
              ),
              SwitchListTile.adaptive(
                title: const Text('Enable notifications'),
                subtitle: const Text('Enable notifications'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                checkColor: Colors.white,
                activeColor: Colors.black,
                title: const Text('Marketing emails'),
                subtitle: const Text("We won't spam you"),
                value: false,
                onChanged: (value) {},
              ),
              ListTile(
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (kDebugMode) {
                    print(date);
                  }

                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (kDebugMode) {
                    print(time);
                  }

                  final booking = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(1980),
                    lastDate: DateTime(2030),
                    builder: (context, child) => Theme(
                      data: ThemeData(
                        appBarTheme: const AppBarTheme(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                        ),
                      ),
                      child: child!,
                    ),
                  );
                  if (kDebugMode) {
                    print(booking);
                  }
                },
                title: const Text('What is your birthday?'),
              ),
              ListTile(
                title: const Text('Log out (iOS)'),
                textColor: Colors.red,
                onTap: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: const Text('Are you sure?'),
                      content: const Text("Please dont go"),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('No'),
                        ),
                        CupertinoDialogAction(
                          onPressed: () {
                            ref.read(authRepo).signOut();
                            context.go('/');
                          },
                          isDestructiveAction: true,
                          child: const Text('Yes'),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Log out (Android)'),
                textColor: Colors.red,
                onTap: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      icon: const FaIcon(FontAwesomeIcons.skull),
                      title: const Text('Are you sure?'),
                      content: const Text("Please dont go"),
                      actions: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const FaIcon(FontAwesomeIcons.car),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Yes'),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Log out (iOS / Bottom)'),
                textColor: Colors.red,
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      title: const Text('Are you sure?'),
                      message: const Text('Please dooooont goooooo'),
                      actions: [
                        CupertinoActionSheetAction(
                          onPressed: () => Navigator.of(context).pop(),
                          isDefaultAction: true,
                          child: const Text('Not log out'),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () => Navigator.of(context).pop(),
                          isDestructiveAction: true,
                          child: const Text('Yes please'),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const AboutListTile(),
            ],
          ),
        ),
      ),
    );
  }
}
