import 'package:my_products/domain/models/category.dart';
import 'package:my_products/utils/extensions/string_extension.dart';

class CategoryDTO {
  final List<String> categories;

  CategoryDTO(this.categories);

  static Category fromJson(String name) {
    return Category(
      name: name.capitalize(),
    );
  }

  List<String> toJson() {
    return categories;
  }
}
