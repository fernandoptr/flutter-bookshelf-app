import 'package:bookshelf_app/theme.dart';
import 'package:flutter/material.dart';

class ChipCategories extends StatefulWidget {
  const ChipCategories({Key? key}) : super(key: key);

  @override
  State<ChipCategories> createState() => _ChipCategoriesState();
}

class _ChipCategoriesState extends State<ChipCategories> {
  static final List<String> _categories = [
    'All Books',
    'Fiction',
    'Non Fiction',
    'Self Help',
    'Documentary',
    'Fantasy',
    'Romance',
    'Action',
    'Comedy'
  ];

  static final List<String> _chipColor = [
    "#F2E5FF",
    "#E5FFE5",
    "#FFE5E5",
    "#FFF2E5",
    "#E5FFFF",
    "#E5F2FF",
    "#E5E5FF",
    "#FFE5FF",
    "#FFE5F2"
  ];

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  int? _value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    style: Theme.of(context).textTheme.caption,
                  ),
                  selected: _value == index,
                  selectedColor: BookShelfTheme.blueDolphin,
                  backgroundColor: hexToColor(_chipColor[index]),
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? index : null;
                    });
                  },
                );
              },
            ).toList(),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
