import 'package:bookshelf_app/models/book.dart';
import 'package:bookshelf_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_ns/liquid_progress_indicator.dart';

class BookProgress extends StatelessWidget {
  final Book book;

  const BookProgress({Key? key, required this.book}) : super(key: key);

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: BookShelfTheme.ink04,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  book.bookCover,
                  width: 70,
                ),
              ),
              const SizedBox(width: 10),
              // ignore: sized_box_for_whitespace
              Container(
                width: 160,
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
                    Chip(
                      label: Text(
                        book.category,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      backgroundColor: hexToColor(book.accentColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // ignore: sized_box_for_whitespace
          Container(
            width: 50,
            height: 50,
            child: LiquidCircularProgressIndicator(
              value: book.progressValue,
              valueColor:
                  const AlwaysStoppedAnimation(BookShelfTheme.blueDolphin),
              backgroundColor: Colors.white,
              borderColor: Colors.transparent,
              borderWidth: 5.0,
              direction: Axis.vertical,
              center: Text(
                "${(book.progressValue * 100).toStringAsFixed(0)} %",
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: BookShelfTheme.ink02),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
