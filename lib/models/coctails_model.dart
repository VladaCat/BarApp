
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

  static bool checkJson(Map<String, dynamic> json){
  return json.containsKey("idDrink") && json.containsKey("strDrink") && json.containsKey("strDrinkAlternate") && json.containsKey("strDrinkThumb");
}

  factory Coctail.fromJson(Map<String, dynamic> json) {
    return Coctail(
        id: json['idDrink'],
        strDrink: json['strDrink'],
        strDrinkAlternate: json['strDrinkAlternate'],
        strDrinkThumb: json['strDrinkThumb']);
  }
}
