import 'package:bookshelf_app/screens/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'theme.dart';

void main() {
  runApp(const Bookshelf());
}

class Bookshelf extends StatelessWidget {
  const Bookshelf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = BookShelfTheme.light();

    return MaterialApp(
      title: 'Bookshelf',
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const BottomNavBar(),
    );
  }
}
