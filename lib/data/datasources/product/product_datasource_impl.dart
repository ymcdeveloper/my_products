import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_products/data/datasources/product/product_datasource.dart';
import 'package:my_products/data/dtos/product_dto/product_dto.dart';
import 'package:my_products/domain/models/category.dart';
import 'package:my_products/domain/models/product.dart';
import 'package:my_products/utils/errors/failure.dart';
import 'package:my_products/utils/errors/failures.dart';
import 'package:my_products/utils/extensions/response_extension.dart';
import 'package:my_products/utils/services/local_storage.dart';

class ProductDatasourceImpl implements ProductDataSource {
  final Dio dio;
  final LocalStorage _localStorage;

  ProductDatasourceImpl(this.dio, this._localStorage);

  @override
  Future<Either<Failure, List<Product>>> getProductsByCategory(Category category) async {
    try {
      String url = category.isAllProducts() ? 'products' : 'products/category/${category.name.toLowerCase()}';
      final response = await dio.get(url);
      if (response.isSuccessfulAndHasData()) {
        final List items = response.data as List;
        final products = items.map((product) => ProductDto.fromJson(product)).toList();
        final wishlist = await _localStorage.getWishlist();
        for (var product in products) {
          product.isWishlisted = wishlist.contains(product.id);
        }

        return Right(products);
      } else {
        return Left(GetProductsByCategoryFailure('Failed to load products'));
      }
    } catch (e) {
      return Left(GetProductsByCategoryFailure('Failed to load products'));
    }
  }
}
