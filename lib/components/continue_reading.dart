import 'package:bookshelf_app/components/reading_book_list_view.dart';
import 'package:bookshelf_app/models/book.dart';
import 'package:flutter/material.dart';

class ContinueReading extends StatelessWidget {
  final List<Book> books;

  const ContinueReading({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Continue Reading",
          style: Theme.of(context).textTheme.headline2,
        ),
        const SizedBox(height: 10),
        Container(
          height: 141,
          child: ReadingBookListView(books: books),
        ),
      ],
    );
  }
}
