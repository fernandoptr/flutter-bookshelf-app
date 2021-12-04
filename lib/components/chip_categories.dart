import 'package:bookshelf_app/components/reading_book_list_view.dart';
import 'package:flutter/material.dart';

class ChipCategories extends StatelessWidget {
  const ChipCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 10,
          color: Colors.amber,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
