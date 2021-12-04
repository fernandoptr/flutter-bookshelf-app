import 'package:bookshelf_app/components/book_thumbnail.dart';
import 'package:bookshelf_app/models/book.dart';
import 'package:flutter/material.dart';

class BookListView extends StatelessWidget {
  final List<Book> books;

  const BookListView({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        final book = books[index];
        return BookThumbnail(book: book);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
      itemCount: books.length,
    );
  }
}
