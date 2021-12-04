import 'package:bookshelf_app/components/bottom_nav_bar.dart';
import 'package:bookshelf_app/screens/account_screen.dart';
import 'package:bookshelf_app/screens/book_details_screen.dart';
import 'package:bookshelf_app/screens/bookshelf_screen.dart';
import 'package:bookshelf_app/screens/explore_screen.dart';
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
      routes: {
        BottomNavBar.nameRoute: (context) => const BottomNavBar(),
        BookshelfScreen.nameRoute: (context) => const BookshelfScreen(),
        ExploreScreen.nameRoute: (context) => const ExploreScreen(),
        AccountScreen.nameRoute: (context) => const AccountScreen(),
        BookDetails.nameRoute: (context) => const BookDetails(),
      },
    );
  }
}
