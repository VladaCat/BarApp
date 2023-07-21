import 'package:flutter/material.dart';

class UserFavorite extends StatelessWidget {
  // const UserFavorite({Key?key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Text(
          'No favorite coctails found',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
