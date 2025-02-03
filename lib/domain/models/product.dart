import 'package:my_products/domain/models/rating.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String category;
  final String description;
  final String image;
  final Rating? rating;
  
  bool isWishlisted;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
    this.isWishlisted = false,
    this.rating,
  });
}
