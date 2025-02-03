import 'package:dartz/dartz.dart';
import 'package:my_products/data/datasources/category/category_datasource.dart';
import 'package:my_products/domain/models/category.dart';
import 'package:my_products/domain/repositories/category_repository.dart';
import 'package:my_products/utils/errors/failure.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryDatasource _datasource;

  CategoryRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    return await _datasource.getCategories();
  }
}
