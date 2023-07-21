// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/coctails_model.dart';

Future<List<Coctail>> searchCoctailByFirstLetter() async {
  final response = await http
      .get(Uri.parse('www.thecocktaildb.com/api/json/v1/1/search.php?f=a'));

  if (response.statusCode == 200) {
    // return Coctail.fromJson((jsonDecode(response.body)["drinks"] as List)
    //     .map((e) => e as Map<String, dynamic>)
    //     .toList()[0]);
    return (jsonDecode(response.body)["drinks"] as List)
        .map((el) => Coctail.fromJson(el))
        .toList();
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Coctail> searchCoctailByName() async {
  final response = await http
      .get(Uri.parse('www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita'));

  if (response.statusCode == 200) {
    return Coctail.fromJson((jsonDecode(response.body)["drinks"] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList()[0]);
  } else {
    throw Exception('Failed to load album');
  }
}

class UserCoctails extends StatefulWidget {
  const UserCoctails({super.key});

  @override
  State<UserCoctails> createState() => _UserCoctails();
}

class _UserCoctails extends State<UserCoctails> {
  late Future<List<Coctail>> futureFirstLetterCoctail;
  //final List<Coctail> filtered;

  @override
  void initState() {
    super.initState();
    
    futureFirstLetterCoctail = searchCoctailByFirstLetter();
  }

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
        onChanged: (text){},
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
