import 'dart:convert';

import 'package:my_products/domain/models/product.dart';

import 'rating_dto.dart';

extension ProductDto on Product {
  static Product fromJson(Map<String, dynamic> data) => Product(
        id: data['id'] as int,
        title: data['title'] as String,
        price: data['price'] is int ? (data['price'] as int).toDouble() : data['price'] as double,
        description: data['description'] as String,
        category: data['category'] as String,
        image: data['image'] as String,
        rating: data['rating'] == null ? null : RatingDto.fromJson(data['rating'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
        'rating': rating?.toMap(),
      };

  String toJson() => json.encode(toMap());
}
