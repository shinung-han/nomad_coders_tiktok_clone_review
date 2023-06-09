import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone_2/constants/gaps.dart';
import 'package:tiktok_clone_2/constants/sizes.dart';
import 'package:tiktok_clone_2/features/settings/settings_screen.dart';
import 'package:tiktok_clone_2/users/widgets/persistent_tab_bar.dart';
import 'package:tiktok_clone_2/users/widgets/user_account.dart';

class UserProfileScreen extends StatefulWidget {
  final String username;
  final String tab;

  const UserProfileScreen({
    required this.username,
    required this.tab,
    super.key,
  });

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SafeArea(
        child: DefaultTabController(
          initialIndex: widget.tab == 'likes' ? 1 : 0,
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: Text(widget.username),
                  actions: [
                    IconButton(
                      onPressed: _onGearPressed,
                      icon: const FaIcon(
                        FontAwesomeIcons.gear,
                        size: Sizes.size20,
                      ),
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Gaps.v20,
                      const CircleAvatar(
                        radius: 50,
                        foregroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/118904460?v=4',
                        ),
                        child: Text('신웅'),
                      ),
                      Gaps.v20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '@${widget.username}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.size18,
                            ),
                          ),
                          Gaps.h5,
                          FaIcon(
                            FontAwesomeIcons.solidCircleCheck,
                            size: Sizes.size16,
                            color: Colors.blue.shade500,
                          ),
                        ],
                      ),
                      Gaps.v24,
                      SizedBox(
                        height: Sizes.size48,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const UserAccount(count: '97', text: 'Following'),
                            _verticalDivider(),
                            const UserAccount(
                                count: '10.5M', text: 'Followers'),
                            _verticalDivider(),
                            const UserAccount(count: '149.3M', text: 'Likes'),
                          ],
                        ),
                      ),
                      Gaps.v14,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size16,
                              horizontal: 50,
                            ),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(Sizes.size4),
                                )),
                            child: const Text(
                              'Follower',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Gaps.h5,
                          _userIcon(FontAwesomeIcons.youtube),
                          Gaps.h5,
                          _userIcon(FontAwesomeIcons.caretDown),
                        ],
                      ),
                      Gaps.v14,
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.size32,
                        ),
                        child: Text(
                          'All highlights and where to watch live matches on FIFA+ I wonder how it would look-!',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Gaps.v14,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.link,
                            size: Sizes.size12,
                          ),
                          Gaps.h4,
                          Text(
                            'httpsL//apple.com/kr',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Gaps.v20,
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  delegate: PersistentTabBar(),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: 20,
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: Sizes.size2,
                    mainAxisSpacing: Sizes.size2,
                    childAspectRatio: 9 / 14,
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 9 / 14,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/images/placeholder.jpeg',
                              image:
                                  'https://images.unsplash.com/photo-1627454819213-4b261f3c3b90?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=998&q=80',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Positioned(
                            bottom: 0,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.play_arrow_outlined,
                                  color: Colors.white,
                                ),
                                Gaps.h4,
                                Text(
                                  '4.1M',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Center(
                  child: Text('Page one'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _userIcon(IconData icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            Sizes.size4,
          ),
        ),
      ),
      child: Center(
        child: FaIcon(icon),
      ),
    );
  }

  VerticalDivider _verticalDivider() {
    return VerticalDivider(
      width: Sizes.size32,
      thickness: Sizes.size1,
      color: Colors.grey.shade400,
      indent: Sizes.size14,
      endIndent: Sizes.size14,
    );
  }
}
