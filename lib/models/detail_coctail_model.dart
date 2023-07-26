class DetailCoctail {
  final String id;
  final String strDrink;
  final String? strDrinkAlternate;
  final String strDrinkThumb;
  final String strGlass;
  final String? strInstruction;
  final String? strIngredient1;
  final String? strIngredient2;
  final String? strIngredient3;
  final String? strIngredient4;
  final String? strIngredient5;
  final String? strIngredient6;
  final String? strIngredient7;
  final String? strIngredient8;
  final String? strIngredient9;
  final String? strIngredient10;
  final String? strIngredient11;
  final String? strIngredient12;
  final String? strIngredient13;
  final String? strIngredient14;
  final String? strIngredient15;

  const DetailCoctail({
    required this.id,
    required this.strDrink,
    required this.strDrinkAlternate,
    required this.strDrinkThumb,
    required this.strGlass,
    required this.strInstruction,
    required this.strIngredient1,
    required this.strIngredient2,
    required this.strIngredient3,
    required this.strIngredient4,
    required this.strIngredient5,
    required this.strIngredient6,
    required this.strIngredient7,
    required this.strIngredient8,
    required this.strIngredient9,
    required this.strIngredient10,
    required this.strIngredient11,
    required this.strIngredient12,
    required this.strIngredient13,
    required this.strIngredient14,
    required this.strIngredient15,
  });

  factory DetailCoctail.fromJson(Map<String, dynamic> json) {
    return DetailCoctail(
        id: json['idDrink'],
        strDrink: json['strDrink'],
        strDrinkAlternate: json['strDrinkAlternate'],
        strDrinkThumb: json['strDrinkThumb'],
        strGlass: json['strGlass'],
        strInstruction: json['strInstruction'],
        strIngredient1: json['strIngredient1'],
        strIngredient2: json['strIngredient2'],
        strIngredient3: json['strIngredient3'],
        strIngredient4: json['strIngredient4'],
        strIngredient5: json['strIngredient5'],
        strIngredient6: json['strIngredient6'],
        strIngredient7: json['strIngredient7'],
        strIngredient8: json['strIngredient8'],
        strIngredient9: json['strIngredient9'],
        strIngredient10: json['strIngredient10'],
        strIngredient11: json['strIngredient11'],
        strIngredient12: json['strIngredient12'],
        strIngredient13: json['strIngredient13'],
        strIngredient14: json['strIngredient14'],
        strIngredient15: json['strIngredient15'],
        );
  }
}
