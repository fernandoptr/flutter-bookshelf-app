import 'package:bookshelf_app/components/book_list_view.dart';
import 'package:bookshelf_app/components/chip_categories.dart';
import 'package:bookshelf_app/components/reading_book_list_view.dart';
import 'package:bookshelf_app/models/book.dart';
import 'package:flutter/material.dart';

class YourBook extends StatelessWidget {
  final List<Book> books;

  const YourBook({Key? key, required this.books}) : super(key: key);

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
        const ChipCategories(),
        BookListView(books: books),
      ],
    );
  }
}
