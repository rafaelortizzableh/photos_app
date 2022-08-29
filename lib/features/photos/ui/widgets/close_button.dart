import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';

class CloseFullScreenButton extends StatelessWidget {
  const CloseFullScreenButton({
    Key? key,
    required this.color,
    this.onClose,
  }) : super(key: key);
  final Color color;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 37.0,
      color: color,
      onPressed: () {
        if (onClose != null) onClose!();

        Navigator.pop(context);
      },
      icon: const Icon(CupertinoIcons.xmark_circle),
    );
  }
}
