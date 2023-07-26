// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:your_best_bar/pages/cards/coctail_card.dart';
import '../models/coctails_model.dart';

Future<List<Coctail>> searchCoctailByFirstLetter(String letter) async {
  final response = await http.get(Uri.parse(
      "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=$letter"));

  if (response.statusCode == 200) {
    return (jsonDecode(response.body)["drinks"] as List)
        .map((el) => Coctail.fromJson(el))
        .toList();
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<Coctail>> searchCoctailByName(String ct_name) async {
  final response = await http.get(Uri.parse(
      "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$ct_name"));

  if (response.statusCode == 200) {
    var tmp = jsonDecode(response.body) as Map<String, dynamic>;
    if (tmp["drinks"] == null) {
      return List.from([]);
    } else {
      var list = tmp["drinks"] as List;
      if (Coctail.checkJson(list[0])) {
        return list.map((e) => Coctail.fromJson(e)).toList();
      } else {
        return List.from([]);
      }
    }
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

  List<Coctail> _coctailsList = List.filled(
    6,
    Coctail(
      id: '17027',
      strDrink: 'Moxito',
      strDrinkAlternate: '',
      strDrinkThumb:
          "https://www.thecocktaildb.com/images/media/drink/1wifuv1485619797.jpg",
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 20),
            searchBox(),
            SizedBox(height: 10),

            coctailList(),
            SizedBox(height: 10),
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
        onChanged: (text) {
          if (text.isEmpty) {
            return;
          }
          if (text.length < 2) {
            searchCoctailByFirstLetter(text.split('')[0]).then(
              (value) => {
                setState(
                  () {
                    _coctailsList = value;
                  },
                ),
              },
            );
          } else {
            searchCoctailByName(text).then(
              (value) => {
                setState(
                  () {
                    _coctailsList = value;
                  },
                ),
              },
            );
          }
        },
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

  Widget coctailList() {
    return Column(
      children: [
        Container(
          height: 600,
          child: ListView.builder(
            itemCount: _coctailsList.length,
            itemBuilder: (context, index) {
              return CoctailCard(
                coctail_name: _coctailsList[index].strDrink,
                coctail_image: _coctailsList[index].strDrinkThumb,
                coctail_id: _coctailsList[index].id,
              );
            },
          ),
        ),
      ],
    );
  }
}
