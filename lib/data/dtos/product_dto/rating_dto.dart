import 'dart:convert';

import 'package:my_products/domain/models/rating.dart';

extension RatingDto on Rating {
  static Rating fromJson(Map<String, dynamic> data) => Rating(
        rate: (data['rate'] as num?)?.toDouble(),
        count: data['count'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'rate': rate,
        'count': count,
      };

  String toJson() => json.encode(toMap());
}
