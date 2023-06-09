import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone_2/constants/breakpoints.dart';
import 'package:tiktok_clone_2/constants/gaps.dart';
import 'package:tiktok_clone_2/constants/sizes.dart';
import 'package:tiktok_clone_2/utils.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  String _word = '';

  bool _isWriting = false;

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      if (_textEditingController.text.isNotEmpty) {
        setState(() {
          _word = _textEditingController.text;
          _isWriting = true;
        });
      }
    });
  }

  void _onSearchChanged(String value) {
    print('Searching form $value');
  }

  void _onSearchSubmitted(String value) {
    print('Submitted $value');
  }

  void _onDeleteWord() {
    setState(() {
      _textEditingController.clear();
      _isWriting = false;
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 1,
          title: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: Breakpoints.sm),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: Sizes.size48,
                    child: TextField(
                      focusNode: _focusNode,
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            Sizes.size8,
                          ),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: isDarkMode(context)
                            ? Colors.grey.shade800
                            : Colors.grey.shade100,
                        filled: true,
                        hintText: 'Search..',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                            left: Sizes.size14,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.magnifyingGlass,
                                color: isDarkMode(context)
                                    ? Colors.grey.shade500
                                    : Colors.black,
                                size: Sizes.size20,
                              ),
                            ],
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(
                            left: Sizes.size16,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (_isWriting)
                                GestureDetector(
                                  onTap: _onDeleteWord,
                                  child: FaIcon(
                                    FontAwesomeIcons.circleXmark,
                                    size: Sizes.size20,
                                    color: isDarkMode(context)
                                        ? Colors.grey.shade500
                                        : Colors.grey.shade700,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: Sizes.size16,
                    right: Sizes.size4,
                  ),
                  child: Image.asset(
                    'assets/images/filter.png',
                    scale: 16,
                    color: isDarkMode(context) ? Colors.grey.shade400 : null,
                  ),
                ),
              ],
            ),
          ),
          bottom: TabBar(
            onTap: (value) => _focusNode.unfocus(),
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            isScrollable: true,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            indicatorColor: Theme.of(context).tabBarTheme.indicatorColor,
            tabs: [
              for (var tab in tabs) Tab(text: tab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: 20,
              padding: const EdgeInsets.all(Sizes.size6),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width > Breakpoints.md ? 5 : 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 9 / 20,
              ),
              itemBuilder: (context, index) => LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Sizes.size4,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 9 / 16,
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/images/placeholder.jpeg',
                            image:
                                'https://images.unsplash.com/photo-1627454819213-4b261f3c3b90?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=998&q=80',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Gaps.v10,
                      const Text(
                        'This is very long caption for my tiktok that im upload just now currently.',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: Sizes.size16 + Sizes.size2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gaps.v8,
                      // if (constraints.maxWidth > 250 ||
                      //     constraints.maxWidth < 200)
                      DefaultTextStyle(
                        style: TextStyle(
                          color: isDarkMode(context)
                              ? Colors.grey.shade300
                              : Colors.grey.shade600,
                          fontWeight: FontWeight.w600,
                        ),
                        child: const Row(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundImage: NetworkImage(
                                'https://avatars.githubusercontent.com/u/118904460?v=4',
                              ),
                            ),
                            Gaps.h4,
                            Expanded(
                              child: Text(
                                'My avatar is going to be very long',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Gaps.h4,
                            FaIcon(
                              FontAwesomeIcons.heart,
                              size: Sizes.size16,
                            ),
                            Gaps.h2,
                            Text('2.5M'),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(
                    fontSize: Sizes.size32,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
