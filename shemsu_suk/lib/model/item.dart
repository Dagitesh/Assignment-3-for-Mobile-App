// class item {
//   int id;
//   String category;
//   String name;
//   bool inStock;

//   item({required this.id, required this.category, required this.name, required this.inStock});
 
//   factory item.fromJson(Map<String, dynamic> json) {
//     return item(
//     id :json['id'],
//     category : json['category'],
//     name : json['name'],
//     inStock: json['inStock'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['category'] = this.category;
//     data['name'] = this.name;
//     data['inStock'] = this.inStock;
//     return data;
//   }
// }
class item{
  num id;
  String title;
  num price;
  String description;
  String category;
  String image;
  // String rating;
  // num count;





item({
  required this.id,
  required this.title,
  required this.price,
  required this.description,
  required this.category,
  required this.image,
  // required this.rating,
  // required this.count

});

factory item.fromjson(Map<String, dynamic>parsedjson){
  return item(
    id: parsedjson['id'],
    title: parsedjson['title'],
    price: parsedjson['price'],
    description: parsedjson['description'],
    category: parsedjson['category'],
    image: parsedjson['image'],
    // rating: parsedjson['rating'],
    // count: parsedjson['count'],
  );
}
static List asbezaList(List asbeza) {
    List asbezas = [];
    for (var i = 0; i < asbeza.length; i++) {
      asbezas.add(item.fromjson(asbeza[i]));
    }
    return asbezas;
  }

}