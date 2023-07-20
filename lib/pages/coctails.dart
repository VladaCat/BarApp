// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class UserCoctails extends StatelessWidget {
  // const UserHome({Key?key}):super(key: key);

  // Future<void> getCoctailsList(var id) async {
  //   var url = Uri.parse('www.thecocktaildb.com/api/json/v1/1/search.php?f=a');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 60),
            searchBox(),
          ],
        ),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            maxWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
  // return const Center(
  //   child: Text(
  //     'Coctails',
  //     style: TextStyle(fontSize: 50),
  //   ),
  // );
}
