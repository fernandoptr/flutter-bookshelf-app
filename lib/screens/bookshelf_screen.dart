import 'package:bookshelf_app/api/mock_bookshelf_service.dart';
import 'package:bookshelf_app/components/chip_categories.dart';
import 'package:bookshelf_app/components/continue_reading.dart';
import 'package:bookshelf_app/components/user_header.dart';
import 'package:bookshelf_app/models/book.dart';
import 'package:flutter/material.dart';

class BookshelfScreen extends StatefulWidget {
  const BookshelfScreen({Key? key}) : super(key: key);
  @override
  State<BookshelfScreen> createState() => _BookshelfScreenState();
}

class _BookshelfScreenState extends State<BookshelfScreen> {
  final mockService = MockBookshelfService();

  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      // ignore: avoid_print
      print('reached the bottom');
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      // ignore: avoid_print
      print('reached the top!');
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getBookData(),
      builder: (context, AsyncSnapshot<List<Book>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 30,
                ),
                child: ListView(
                  controller: _controller,
                  scrollDirection: Axis.vertical,
                  children: [
                    const UserHeader(
                      userName: "Hi, Nando",
                      greet: "Good Morning",
                      imageProvider:
                          AssetImage('assets/images/profile-pic.jpg'),
                    ),
                    const SizedBox(height: 20),
                    ContinueReading(books: snapshot.data ?? []),
                    const SizedBox(height: 16),
                    const ChipCategories(),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
