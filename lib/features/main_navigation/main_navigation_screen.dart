import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone_2/constants/gaps.dart';
import 'package:tiktok_clone_2/constants/sizes.dart';
import 'package:tiktok_clone_2/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone_2/features/onboarding/widgets/post_video_button.dart';
import 'package:tiktok_clone_2/features/videos/video_timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text('Record video'),
          ),
          body: const Center(
            child: Text('Post'),
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _selectIndex == 0 ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectIndex != 1,
            child: const Center(
              child: Text('Discover'),
            ),
          ),
          Offstage(
            offstage: _selectIndex != 3,
            child: const Center(
              child: Text('Inbox'),
            ),
          ),
          Offstage(
            offstage: _selectIndex != 4,
            child: const Center(
              child: Text('Profile'),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                text: 'Home',
                isSelected: _selectIndex == 0,
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                onTap: () => _onTap(0),
              ),
              NavTab(
                text: 'Discover',
                isSelected: _selectIndex == 1,
                icon: FontAwesomeIcons.compass,
                selectedIcon: FontAwesomeIcons.solidCompass,
                onTap: () => _onTap(1),
              ),
              Gaps.h24,
              GestureDetector(
                onTap: _onPostVideoButtonTap,
                child: const PostVideoButton(),
              ),
              Gaps.h24,
              NavTab(
                text: 'Inbox',
                isSelected: _selectIndex == 3,
                icon: FontAwesomeIcons.message,
                selectedIcon: FontAwesomeIcons.solidMessage,
                onTap: () => _onTap(3),
              ),
              NavTab(
                text: 'Profile',
                isSelected: _selectIndex == 4,
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
