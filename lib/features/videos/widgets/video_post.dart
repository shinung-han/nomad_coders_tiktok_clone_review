import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone_2/common/widgets/video_config/video_config.dart';
import 'package:tiktok_clone_2/constants/gaps.dart';
import 'package:tiktok_clone_2/constants/sizes.dart';
import 'package:tiktok_clone_2/features/videos/widgets/video_button.dart';
import 'package:tiktok_clone_2/features/videos/widgets/video_comments.dart';
import 'package:tiktok_clone_2/generated/l10n.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;

  final int index;

  const VideoPost({
    required this.onVideoFinished,
    required this.index,
    super.key,
  });

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset('assets/videos/video.MOV');

  late final AnimationController _animationController;

  bool _isPaused = false;
  bool _volume = true;

  bool _autoMute = videoConfig.autoMute;

  final Duration _animationDuration = const Duration(milliseconds: 150);

  void _onVideochange() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  void _initVideoPlayer() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    if (kIsWeb) {
      await _videoPlayerController.setVolume(0);
      setState(() {
        _volume = false;
      });
    }
    setState(() {});
    _videoPlayerController.addListener(_onVideochange);
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();

    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.5,
      upperBound: 2.0,
      value: 2.0,
      duration: _animationDuration,
    );

    videoConfig.addListener(() {
      setState(() {
        _autoMute = videoConfig.autoMute;
      });
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!mounted) return;
    if (info.visibleFraction == 1 &&
        !_isPaused &&
        !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }
    if (_videoPlayerController.value.isPlaying && info.visibleFraction == 0) {
      _onTogglePause();
    }
  }

  void _onTogglePause() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _onCommentTap(BuildContext context) async {
    if (_videoPlayerController.value.isPlaying) {
      _onTogglePause();
    }
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return const VideoComments();
      },
    );
    _onTogglePause();
  }

  void _onVolumePressed() {
    if (kIsWeb) {
      _setVolume();
    } else {
      _setVolume();
    }
  }

  void _setVolume() async {
    if (_volume == false) {
      await _videoPlayerController.setVolume(100);
      setState(() {
        _volume = true;
      });
    } else {
      await _videoPlayerController.setVolume(0);
      setState(() {
        _volume = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(
                    color: Colors.black,
                  ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: _onTogglePause,
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animationController.value,
                      child: child,
                    );
                  },
                  child: AnimatedOpacity(
                    duration: _animationDuration,
                    opacity: _isPaused ? 1 : 0,
                    child: const FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                      size: Sizes.size52,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '@신웅',
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v10,
                Text(
                  "I'm Flutter master 🚀✨",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Colors.white,
                  ),
                ),
                Gaps.v10,
              ],
            ),
          ),
          Positioned(
            left: Sizes.size20,
            top: Sizes.size60,
            child: IconButton(
              onPressed: videoConfig.toggleAutoMute,
              icon: FaIcon(
                _autoMute
                    ? FontAwesomeIcons.volumeOff
                    : FontAwesomeIcons.volumeHigh,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  foregroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/118904460?v=4'),
                  child: Text('신웅'),
                ),
                Gaps.v16,
                VideoButton(
                  icon: FontAwesomeIcons.solidHeart,
                  text: S.of(context).likeCount(129812),
                ),
                Gaps.v16,
                GestureDetector(
                  onTap: () => _onCommentTap(context),
                  child: VideoButton(
                    icon: FontAwesomeIcons.solidComment,
                    text: S.of(context).commentCount(123123),
                  ),
                ),
                Gaps.v16,
                const VideoButton(
                  icon: FontAwesomeIcons.share,
                  text: 'Share',
                ),
              ],
            ),
          ),
          Positioned(
            right: Sizes.size14,
            top: Sizes.size52,
            child: IconButton(
              icon: FaIcon(
                _volume
                    ? FontAwesomeIcons.volumeHigh
                    : FontAwesomeIcons.volumeXmark,
                color: Colors.white,
              ),
              onPressed: _onVolumePressed,
            ),
          ),
        ],
      ),
    );
  }
}
