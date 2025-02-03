import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_products/data/datasources/category_datasource.dart';
import 'package:my_products/data/dtos/category_dto.dart';
import 'package:my_products/domain/models/category.dart';
import 'package:my_products/utils/errors/failure.dart';
import 'package:my_products/utils/errors/failures.dart';
import 'package:my_products/utils/extensions/response_extension.dart';

class CategoryDatasourceImpl implements CategoryDatasource {
  final Dio dio;

  CategoryDatasourceImpl({required this.dio});

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final response = await dio.get('products/categories').timeout(Duration(seconds: 5));

      if (response.isSuccessfulAndHasData()) {
        final list = response.data as List<dynamic>;
        final categories = list.map((category) => CategoryDTO.fromJson(category)).toList();

        categories.add(Category(name: 'Ver todos'));

        return Right(categories);
      } else {
        return Left(GetCategoriesFailure('Failed to load categories'));
      }
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      return Left(GetCategoriesFailure('Failed to load categories'));
    }
  }
}
