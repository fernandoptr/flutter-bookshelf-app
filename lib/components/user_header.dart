import 'package:bookshelf_app/theme.dart';
import 'package:flutter/material.dart';

class UserHeader extends StatelessWidget {
  final String userName;
  final String greet;
  final ImageProvider? imageProvider;

  const UserHeader(
      {Key? key,
      required this.userName,
      required this.greet,
      this.imageProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundImage: imageProvider,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: BookShelfTheme.lightTextTheme.headline4,
                ),
                Text(
                  greet,
                  style: BookShelfTheme.lightTextTheme.headline5!.copyWith(
                      color: BookShelfTheme.ink02, fontWeight: FontWeight.w300),
                )
              ],
            ),
          ],
        ),
        IconButton(
          // ignore: avoid_returning_null_for_void
          onPressed: () => null,
          // 4 NOTE: Set the icon, size and color of the icon.
          icon: const Icon(Icons.add),
          iconSize: 30,
          color: BookShelfTheme.ink01,
        ),
      ],
    );
  }
}
