import 'package:bookshelf_app/components/book_progress.dart';
import 'package:bookshelf_app/models/book.dart';
import 'package:flutter/material.dart';

class ReadingBookListView extends StatelessWidget {
  final List<Book> books;

  const ReadingBookListView({Key? key, required this.books}) : super(key: key);

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemBuilder: (context, index) {
        final book = books[index + 4];
        return BookProgress(book: book);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(width: 10);
      },
      itemCount: 3,
    );
  }
}
