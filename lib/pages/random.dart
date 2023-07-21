
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/coctails_model.dart';

Future<Coctail> fetchCoctail() async {
  final response = await http
      .get(Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/random.php'));

  if (response.statusCode == 200) {
    return Coctail.fromJson((jsonDecode(response.body)["drinks"] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList()[0]);
  } else {
    throw Exception('Failed to load album');
  }
}

class UserRandom extends StatefulWidget {
  const UserRandom({super.key});

  @override
  State<UserRandom> createState() => _UserRandom();
}

class _UserRandom extends State<UserRandom> {
  late Future<Coctail> futureRandomCoctail;
  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    futureRandomCoctail = fetchCoctail();

    const oneSec = const Duration(seconds: 10);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        debugPrint(timer.tick.toString());
        setState(() {
            futureRandomCoctail = fetchCoctail();
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
            future: futureRandomCoctail,
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
