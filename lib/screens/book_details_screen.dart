import 'package:bookshelf_app/models/book.dart';
import 'package:bookshelf_app/theme.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  static const nameRoute = '/bookDetails';

  const BookDetails({Key? key}) : super(key: key);

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    final book = ModalRoute.of(context)!.settings.arguments as Book;

    return SafeArea(
      child: Scaffold(
        backgroundColor: hexToColor(book.accentColor),
        body: SizedBox.expand(
          child: Stack(
            children: [
              Column(
                children: [
                  const Header(),
                  const SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      book.bookCover,
                      width: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    book.title,
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    book.meta,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox.expand(
                child: DraggableScrollableSheet(
                  initialChildSize: 0.43,
                  minChildSize: 0.43,
                  maxChildSize: 0.7,
                  builder: (context, scrollController) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(40)),
                      ),
                      child: ListView(
                        controller: scrollController,
                        children: [
                          Center(
                            child: Container(
                              height: 6,
                              width: 100,
                              decoration: BoxDecoration(
                                color: BookShelfTheme.ink04,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          MetaContainer(book: book),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Description",
                              style: Theme.of(context).textTheme.headline5),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(book.description,
                              style: Theme.of(context).textTheme.bodyText2),
                          const SizedBox(
                            height: 20,
                          ),
                          const ReadButton(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReadButton extends StatelessWidget {
  const ReadButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
        onPressed: () {},
        child: Text('Continue Reading',
            style: Theme.of(context).textTheme.headline5),
        style: TextButton.styleFrom(
            backgroundColor: BookShelfTheme.blueDolphin,
            primary: BookShelfTheme.ink02,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
      ),
    );
  }
}

class MetaContainer extends StatelessWidget {
  const MetaContainer({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
          color: BookShelfTheme.ink05,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(book.currentPage.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w400)),
                const SizedBox(
                  height: 5,
                ),
                Text("Last Page",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        fontWeight: FontWeight.w300,
                        color: BookShelfTheme.ink02)),
              ],
            ),
            const VerticalDivider(
              color: BookShelfTheme.ink04,
              thickness: 1,
            ),
            Column(
              children: [
                Text("ENG",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w400)),
                const SizedBox(
                  height: 5,
                ),
                Text("Language",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        fontWeight: FontWeight.w300,
                        color: BookShelfTheme.ink02)),
              ],
            ),
            const VerticalDivider(
              color: BookShelfTheme.ink04,
              thickness: 1,
            ),
            Column(
              children: [
                Text(book.pages.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w400)),
                const SizedBox(
                  height: 5,
                ),
                Text("Number of Page",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        fontWeight: FontWeight.w300,
                        color: BookShelfTheme.ink02)),
              ],
            ),
          ],
        ));
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.chevron_left_rounded,
              size: 35,
            ),
          ),
          Text(
            "Detail Book",
            style: Theme.of(context).textTheme.headline4,
          ),
          const Icon(Icons.share_rounded),
        ],
      ),
    );
  }
}
