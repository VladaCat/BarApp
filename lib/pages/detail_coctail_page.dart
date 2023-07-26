import 'package:flutter/material.dart';
import 'package:your_best_bar/models/detail_coctail_model.dart';

class DetailCoctailPage extends StatefulWidget {
  const DetailCoctailPage({super.key});

  @override
  State<DetailCoctailPage> createState() => _DetailCoctailPageState();
}

class _DetailCoctailPageState extends State<DetailCoctailPage> {
  var model = DetailCoctail(
    id: "id",
    strDrink: "strDrink",
    strDrinkAlternate: "strDrinkAlternate",
    strDrinkThumb: "strDrinkThumb",
    strGlass: "strGlass",
    strInstruction: "strInstruction",
    strIngredient1: "strIngredient1",
    strIngredient2: "strIngredient2",
    strIngredient3: "strIngredient3",
    strIngredient4: "strIngredient4",
    strIngredient5: "strIngredient5",
    strIngredient6: "strIngredient6",
    strIngredient7: "strIngredient7",
    strIngredient8: "strIngredient8",
    strIngredient9: "strIngredient9",
    strIngredient10: "strIngredient10",
    strIngredient11: "strIngredient11",
    strIngredient12: "strIngredient12",
    strIngredient13: "strIngredient13",
    strIngredient14: "strIngredient14",
    strIngredient15: "strIngredient15",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 60),
            Text(model.id),
            Text(model.strDrink),
            Image.network("https:\/\/www.thecocktaildb.com\/images\/media\/drink\/1wifuv1485619797.jpg"),
            Text(model.strGlass),
            Text(model.strDrinkAlternate??""),
            Text(model.strInstruction??""),
            Text(model.strIngredient1??""),
            Text(model.strIngredient2??""),
            Text(model.strIngredient3??""),
            Text(model.strIngredient4??""),
            Text(model.strIngredient5??""),
            Text(model.strIngredient6??""),
            Text(model.strIngredient7??""),
            Text(model.strIngredient8??""),
            Text(model.strIngredient9??""),
            Text(model.strIngredient10??""),
            Text(model.strIngredient11??""),
            Text(model.strIngredient12??""),
            Text(model.strIngredient13??""),
            Text(model.strIngredient14??""),
            Text(model.strIngredient15??""),
          ],
        ),
      ),
    );
  }
}
