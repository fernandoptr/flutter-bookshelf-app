import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  static const nameRoute = '/account';

  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Under Construction \n👷‍♀️🚧👷‍♂️',
          style: Theme.of(context).textTheme.headline1,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
