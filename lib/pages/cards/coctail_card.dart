import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CoctailCard extends StatelessWidget {
  final String coctail_name;
  final String coctail_image;
  final String coctail_id;

  CoctailCard({
    required this.coctail_name,
    required this.coctail_image,
    required this.coctail_id,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        color: Colors.brown,
        child: GestureDetector(
          onTap: () {
            
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                coctail_name,
                style: TextStyle(fontSize: 16),
              ),
              Image.network(coctail_image),
            ],
          ),
        ),
      ),
    );
  }
}
