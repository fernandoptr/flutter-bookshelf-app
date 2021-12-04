import 'package:bookshelf_app/components/book_thumbnail.dart';
import 'package:bookshelf_app/models/book.dart';
import 'package:bookshelf_app/screens/book_detail_screen.dart';
import 'package:flutter/material.dart';

class BookListView extends StatefulWidget {
  List<Book> books;
  String category;

  BookListView({Key? key, required this.books, required this.category})
      : super(key: key);

  @override
  State<BookListView> createState() => _BookListViewState();
}

class _BookListViewState extends State<BookListView> {
  List<Book> filteredBooks = [];

  @override
  void initState() {
    super.initState();
    filteredBooks.addAll(widget.books);
  }

  filterBook(String category) {
    setState(() {
      if (category == "All Books") {
        filteredBooks = widget.books;
      } else {
        filteredBooks =
            widget.books.where((book) => (book.category == category)).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    filterBook(widget.category);

    return ListView.separated(
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        final book = filteredBooks[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BookDetail(book: book)));
          },
          child: BookThumbnail(book: book),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
      itemCount: filteredBooks.length,
    );
  }
}
