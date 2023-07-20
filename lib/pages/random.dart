
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Coctail> fetchCoctail() async {
  final response = await http
      .get(Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/random.php'));

  if (response.statusCode == 200) {
    return Coctail.fromJson((jsonDecode(response.body)["drinks"] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList());
  } else {
    throw Exception('Failed to load album');
  }
}

class Coctail {
  final String id;
  final String strDrink;
  final String? strDrinkAlternate;
  final String strDrinkThumb;

  const Coctail(
      {required this.id,
      required this.strDrink,
      required this.strDrinkAlternate,
      required this.strDrinkThumb});

  factory Coctail.fromJson(List<Map<String, dynamic>> json) {
    return Coctail(
        id: json[0]['idDrink'],
        strDrink: json[0]['strDrink'],
        strDrinkAlternate: json[0]['strDrinkAlternate'],
        strDrinkThumb: json[0]['strDrinkThumb']);
  }
}

class UserRandom extends StatefulWidget {
  const UserRandom({super.key});

  @override
  State<UserRandom> createState() => _UserRandom();
}

class _UserRandom extends State<UserRandom> {
  late Future<Coctail> futureAlbum;
  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchCoctail();

    const oneSec = const Duration(seconds: 10);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        debugPrint(timer.tick.toString());
        setState(() {
            futureAlbum = fetchCoctail();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Center(
          child: FutureBuilder<Coctail>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: Column(
                    children: [
                      SizedBox(height: 100),
                      Image(
                        image: NetworkImage(snapshot.data!.strDrinkThumb),
                      ),
                      SizedBox(height: 40),
                      Text(
                        'Drink Name: ${snapshot.data!.strDrink}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
