import 'package:flutter/material.dart';

class CategoriesScrollView extends StatelessWidget {
  static final List<String> _categories = [
    'All Books',
    'Fiction',
    'Non-Fiction',
    'Self-Help',
    'Documentary',
    'Fantasy',
    'Romance',
    'Action',
    'Comedy'
  ];

  const CategoriesScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [],
      ),
    );
  }
}
