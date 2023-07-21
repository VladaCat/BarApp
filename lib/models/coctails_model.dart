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

  factory Coctail.fromJson(Map<String, dynamic> json) {
    return Coctail(
        id: json['idDrink'],
        strDrink: json['strDrink'],
        strDrinkAlternate: json['strDrinkAlternate'],
        strDrinkThumb: json['strDrinkThumb']);
  }
}
