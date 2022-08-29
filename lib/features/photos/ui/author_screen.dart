import 'package:flutter/material.dart';

import '../photos.dart';

class AuthorScreen extends StatelessWidget {
  const AuthorScreen({
    Key? key,
    required this.photoAuthor,
  }) : super(key: key);
  static const routeName = 'author';
  final PhotoAuthor photoAuthor;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
