import 'package:bookshelf_app/components/reading_scroll_view.dart';
import 'package:flutter/material.dart';

class ChipCategories extends StatelessWidget {
  const ChipCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your Book",
          style: Theme.of(context).textTheme.headline2,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
