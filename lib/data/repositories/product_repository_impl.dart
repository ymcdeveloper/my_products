import 'package:dartz/dartz.dart';
import 'package:my_products/data/datasources/product_datasource.dart';
import 'package:my_products/domain/models/category.dart';
import 'package:my_products/domain/models/product.dart';
import 'package:my_products/domain/repositories/product_repository.dart';
import 'package:my_products/utils/errors/failure.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource _datasource;

  ProductRepositoryImpl({required ProductDataSource productDataSource}) : _datasource = productDataSource;

  @override
  Future<Either<Failure, List<Product>>> getProductsByCategory(Category category) async {
    return await _datasource.getProductsByCategory(category);
  }
}
