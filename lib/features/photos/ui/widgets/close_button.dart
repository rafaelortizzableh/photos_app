import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';

class CloseFullScreenButton extends StatelessWidget {
  const CloseFullScreenButton({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 59.0,
      left: 26.0,
      child: IconButton(
        iconSize: 37.0,
        color: color,
        onPressed: () => Navigator.pop(context),
        icon: const Icon(CupertinoIcons.xmark_circle),
      ),
    );
  }
}
