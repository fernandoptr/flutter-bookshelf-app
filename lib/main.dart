import 'package:flutter/material.dart';
import 'theme.dart';

void main() {
  runApp(const Bookshelf());
}

class Bookshelf extends StatelessWidget {
  const Bookshelf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = BookShelfTheme.light();

    return MaterialApp(
      title: 'Bookshelf',
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Bookshelf',
            style: theme.textTheme.headline3,
          ),
        ),
        body: Center(
          child: Text(
            'Let\'s start the project 👷‍♂️',
            style: theme.textTheme.headline1,
          ),
        ),
      ),
    );
  }
}
