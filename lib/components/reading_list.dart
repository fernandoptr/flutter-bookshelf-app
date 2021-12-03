import 'package:bookshelf_app/components/user_header.dart';
import 'package:flutter/material.dart';

class ReadingList extends StatelessWidget {
  const ReadingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserHeader(
            userName: "Hi, Nando",
            greet: "Good Morning",
            imageProvider: AssetImage('assets/images/profile-pic.jpg'),
          ),
          const SizedBox(height: 16),
          Container(),
        ],
      ),
    );
  }
}
