// ignore: camel_case_types
class grocery {
  String foodTitle;
  String foodDescription;
  String image;
  num foodPrice;

  grocery(
      {required this.foodTitle,
      required this.foodDescription,
      required this.foodPrice,
      required this.image});

  factory grocery.fromJson(Map<String, dynamic> parsedJson) {
    return grocery(
        foodTitle: parsedJson["title"],
        foodDescription: parsedJson["description"],
        foodPrice: parsedJson["price"],
        image: parsedJson["image"]);
  }

  static List asbezaList(List asbeza) {
    List groceries = [];
    for (var i = 0; i < groceries.length; i++) {
      groceries.add(grocery.fromJson(groceries[i]));
    }
    return groceries;
  }
}
