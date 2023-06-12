import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class FlashModeButton extends StatelessWidget {
  final IconData icon;
  final FlashMode nowFlashMode;
  final FlashMode flashMode;
  final VoidCallback setFlashMode;

  const FlashModeButton({
    super.key,
    required this.icon,
    required this.nowFlashMode,
    required this.flashMode,
    required this.setFlashMode,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: nowFlashMode == flashMode ? Colors.amber.shade200 : Colors.white,
      icon: Icon(icon),
      onPressed: setFlashMode,
    );
  }
}
