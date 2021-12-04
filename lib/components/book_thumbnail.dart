import 'package:bookshelf_app/models/book.dart';
import 'package:bookshelf_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_ns/liquid_progress_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BookThumbnail extends StatelessWidget {
  final Book book;

  const BookThumbnail({Key? key, required this.book}) : super(key: key);

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.5, color: BookShelfTheme.ink04),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              book.bookCover,
              width: 70,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: Theme.of(context).textTheme.headline4,
                  maxLines: 2,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  book.meta,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 10),
                  maxLines: 2,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  book.description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontWeight: FontWeight.w400),
                  maxLines: 3,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LinearPercentIndicator(
                      width: 180,
                      lineHeight: 6.0,
                      percent: 0.5,
                      backgroundColor: BookShelfTheme.ink04,
                      progressColor: BookShelfTheme.blueDolphin,
                    ),
                    Text(
                      "${book.currentPage}/${book.pages}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 11),
                      maxLines: 2,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      // ignore: sized_box_for_whitespace
      // Container(
      //   width: 50,
      //   height: 50,
      //   child: LiquidCircularProgressIndicator(
      //     value: book.progressValue,
      //     valueColor:
      //         const AlwaysStoppedAnimation(BookShelfTheme.blueDolphin),
      //     backgroundColor: Colors.white,
      //     borderColor: Colors.transparent,
      //     borderWidth: 5.0,
      //     direction: Axis.vertical,
      //     center: Text(
      //       "${(book.progressValue * 100).toStringAsFixed(0)} %",
      //       style: Theme.of(context)
      //           .textTheme
      //           .caption!
      //           .copyWith(color: BookShelfTheme.ink02),
      //     ),
      //   ),
      // ),
    );
  }
}
