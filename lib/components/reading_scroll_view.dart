import 'package:bookshelf_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_ns/liquid_progress_indicator.dart';

class ReadingScrollView extends StatelessWidget {
  const ReadingScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          ProgressBookCard(
            bookTitle: "The Decagon House Murders",
            bookMeta: "By Yukito Ayatsuji · 2021",
            bookCover: 'assets/images/decagon-book.png',
            chipCategory: "Mystery",
            chipColor: BookShelfTheme.accentLavender,
            progressValue: 0.76,
          ),
          SizedBox(width: 10),
          ProgressBookCard(
            bookTitle: "How to Win Friends and Influence People",
            bookMeta: "By Dale Carnegie · 1998",
            bookCover: 'assets/images/influence-book.png',
            chipCategory: "Self-Help",
            chipColor: BookShelfTheme.accentMistyRose,
            progressValue: 0.42,
          ),
          SizedBox(width: 10),
          ProgressBookCard(
            bookTitle: "The Subtle Art of Not Giving a F*ck",
            bookMeta: "By Mark Manson · 2016 ",
            bookCover: 'assets/images/subtle-book.png',
            chipCategory: "Non-Fiction",
            chipColor: BookShelfTheme.accentAliceBlue,
            progressValue: 0.81,
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
          width: 3,
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
                    const SizedBox(height: 5),
                    Text(
                      bookMeta,
                      style: Theme.of(context).textTheme.bodyText2,
                      maxLines: 2,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
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
