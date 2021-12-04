import 'package:bookshelf_app/components/book_list_view.dart';
import 'package:bookshelf_app/models/book.dart';
import 'package:bookshelf_app/theme.dart';
import 'package:flutter/material.dart';

class YourBook extends StatefulWidget {
  final List<Book> books;

  const YourBook({Key? key, required this.books}) : super(key: key);

  @override
  State<YourBook> createState() => _YourBookState();
}

class _YourBookState extends State<YourBook> {
  static final List<String> _categories = [
    'All Books',
    'Fiction',
    'Non Fiction',
    'Self Help',
    'History',
    'Mystery',
    'Romance',
    'Action',
    'Comedy'
  ];

  static final List<String> _chipColor = [
    "#F2E5FF",
    "#FFE5E5",
    "#E5FFE5",
    "#FFF2E5",
    "#E5FFFF",
    "#E5E5FF",
    "#E5F2FF",
    "#FFE5FF",
    "#FFE5F2"
  ];

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  int? _value = 0;
  String _selectedCategory = "All Books";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your Book",
          style: Theme.of(context).textTheme.headline2,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Wrap(
                spacing: 4,
                children: List<Widget>.generate(
                  9,
                  (int index) {
                    return ChoiceChip(
                      label: Text(
                        _categories[index],
                      ),
                      selected: _value == index,
                      selectedColor: BookShelfTheme.ink02,
                      labelStyle: Theme.of(context).textTheme.caption!.copyWith(
                            color: _value == index
                                ? Colors.white
                                : BookShelfTheme.ink01,
                          ),
                      backgroundColor: hexToColor(_chipColor[index]),
                      onSelected: (bool selected) {
                        setState(() {
                          _value = selected ? index : null;
                          _selectedCategory = _categories[index];
                        });
                        // print(_selectedCategory);
                      },
                    );
                  },
                ).toList(),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
        BookListView(
          books: widget.books,
          category: _selectedCategory,
        ),
      ],
    );
  }
}
