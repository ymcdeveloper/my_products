import 'package:dartz/dartz.dart';
import 'package:my_products/domain/models/category.dart';
import 'package:my_products/utils/errors/failure.dart';

abstract class CategoryDatasource {
  Future<Either<Failure, List<Category>>> getCategories();
}
