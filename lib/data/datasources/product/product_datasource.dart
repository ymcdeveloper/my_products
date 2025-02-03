import 'package:dartz/dartz.dart';
import 'package:my_products/domain/models/category.dart';
import 'package:my_products/domain/models/product.dart';
import 'package:my_products/utils/errors/failure.dart';

abstract class ProductDataSource {
  
  Future<Either<Failure, List<Product>>> getProductsByCategory(Category category);
}