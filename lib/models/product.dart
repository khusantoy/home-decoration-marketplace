import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  String title;
  num price;
  String imageUrl;
  bool isFavourite;
  String categoryID;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.isFavourite,
    required this.categoryID,
  });

  factory Product.fromQuerySnapshot(QueryDocumentSnapshot query) {
    return Product(
      id: query.id,
      title: query['title'],
      price: query['price'],
      imageUrl: query['imageUrl'],
      isFavourite: query['isFavourite'],
      categoryID: query['categoryID'],
    );
  }
}
