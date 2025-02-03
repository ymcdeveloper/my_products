class Category {
  final String name;

  Category({required this.name});

  static Category get allCategories => Category(name: 'Ver todos');

  bool isAllProducts() {
    return name == allCategories.name;
  }
}
