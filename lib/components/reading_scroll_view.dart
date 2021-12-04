import 'package:bookshelf_app/models/book.dart';
import 'package:bookshelf_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_ns/liquid_progress_indicator.dart';

class ReadingScrollView extends StatelessWidget {
  final List<Book> books;

  const ReadingScrollView({Key? key, required this.books}) : super(key: key);

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ProgressBookCard(
            bookTitle: books[0].title,
            bookMeta: books[0].meta,
            bookCover: books[0].bookCover,
            chipCategory: books[0].category,
            chipColor: hexToColor(books[0].accentColor),
            progressValue: books[0].progressValue,
          ),
          const SizedBox(width: 10),
          ProgressBookCard(
            bookTitle: books[1].title,
            bookMeta: books[1].meta,
            bookCover: books[1].bookCover,
            chipCategory: books[1].category,
            chipColor: hexToColor(books[1].accentColor),
            progressValue: books[1].progressValue,
          ),
          const SizedBox(width: 10),
          ProgressBookCard(
            bookTitle: books[2].title,
            bookMeta: books[2].meta,
            bookCover: books[2].bookCover,
            chipCategory: books[2].category,
            chipColor: BookShelfTheme.accentAliceBlue,
            progressValue: books[2].progressValue,
          ),
        ],
      ),
    );
  }
}

class ProgressBookCard extends StatelessWidget {
  final String bookTitle;
  final String bookMeta;
  final String bookCover;
  final String chipCategory;
  final Color chipColor;
  final double progressValue;

  const ProgressBookCard(
      {Key? key,
      required this.bookTitle,
      required this.bookMeta,
      required this.bookCover,
      required this.chipCategory,
      required this.chipColor,
      required this.progressValue})
      : super(key: key);

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
                  bookCover,
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
                      bookTitle,
                      style: Theme.of(context).textTheme.headline4,
                      maxLines: 2,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      bookMeta,
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
                        chipCategory,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      backgroundColor: chipColor,
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
              value: progressValue,
              valueColor:
                  const AlwaysStoppedAnimation(BookShelfTheme.blueDolphin),
              backgroundColor: Colors.white,
              borderColor: Colors.transparent,
              borderWidth: 5.0,
              direction: Axis.vertical,
              center: Text(
                "${(progressValue * 100).toStringAsFixed(0)} %",
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
