import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'favorite.dart';
import 'coctails.dart';
import 'random.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  final user = FirebaseAuth.instance.currentUser;

  final pages = [
    UserCoctails(),
    UserFavorite(),
    UserRandom(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text(
          '${user?.email!}',
          style: const TextStyle(fontSize: 16),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown[500],
        actions: [
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: pages[pageIndex],
      bottomNavigationBar: buildCustomNavBar(context),
    );
  }

  Container buildCustomNavBar(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.brown,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: pageIndex == 0
                    ? const Icon(
                        Icons.coffee,
                        color: Colors.white,
                        size: 30,
                      )
                    : const Icon(
                        Icons.coffee_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
              ),
              const Text(
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
                "Coctails",
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                icon: pageIndex == 1
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 30,
                      )
                    : const Icon(
                        Icons.favorite_outline,
                        color: Colors.white,
                        size: 30,
                      ),
              ),
              const Text(
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
                "Favorite",
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: pageIndex == 2
                    ? const Icon(
                        Icons.auto_awesome,
                        color: Colors.white,
                        size: 30,
                      )
                    : const Icon(
                        Icons.auto_awesome_motion_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
              ),
              const Text(
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
                "Random",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
