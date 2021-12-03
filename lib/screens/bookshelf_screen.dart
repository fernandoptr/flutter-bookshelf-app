import 'package:bookshelf_app/components/continue_reading.dart';
import 'package:flutter/material.dart';

class BookshelfScreen extends StatelessWidget {
  const BookshelfScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: const [
          ContinueReading(),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
