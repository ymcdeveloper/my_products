import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_products/data/datasources/category/category_datasource.dart';
import 'package:my_products/data/datasources/category/category_datasource_impl.dart';
import 'package:my_products/data/datasources/product/product_datasource.dart';
import 'package:my_products/data/datasources/product/product_datasource_impl.dart';
import 'package:my_products/data/repositories/category_repository_impl.dart';
import 'package:my_products/data/repositories/product_repository_impl.dart';
import 'package:my_products/domain/repositories/category_repository.dart';
import 'package:my_products/domain/repositories/product_repository.dart';
import 'package:my_products/ui/categories/cubit/categories_list_cubit.dart';
import 'package:my_products/ui/products/cubit/product_list_cubit.dart';
import 'package:my_products/ui/wishlist/cubit/wishlist_cubit.dart';
import 'package:my_products/utils/services/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

class Inject {
  Future<void> initialize() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Dio dio = Dio();

    dio.options.baseUrl = 'https://fakestoreapi.com/';
    getIt.registerSingleton(dio);
    getIt.registerSingleton(sharedPreferences);

    LocalStorage localStorage = LocalStorage(
      sharedPreferences: getIt<SharedPreferences>(),
    );

    getIt.registerSingleton<LocalStorage>(localStorage);

    _datasources();
    _repositories();
    _cubits();
  }

  void _datasources() {
    getIt.registerFactory<CategoryDatasource>(
      () => CategoryDatasourceImpl(dio: getIt<Dio>()),
    );
    getIt.registerFactory<ProductDataSource>(
      () => ProductDatasourceImpl(
        getIt<Dio>(),
        getIt<LocalStorage>(),
      ),
    );
  }

  void _repositories() {
    getIt.registerFactory<CategoryRepository>(
      () => CategoryRepositoryImpl(
        getIt<CategoryDatasource>(),
      ),
    );
    getIt.registerFactory<ProductRepository>(
      () => ProductRepositoryImpl(
        productDataSource: getIt<ProductDataSource>(),
      ),
    );
  }

  void _cubits() {
    getIt.registerFactory<CategoriesListCubit>(
      () => CategoriesListCubit(
        getIt<CategoryRepository>(),
      ),
    );
    getIt.registerFactory<ProductListCubit>(
      () => ProductListCubit(
        getIt<ProductRepository>(),
      ),
    );
    getIt.registerFactory<WishlistCubit>(
      () => WishlistCubit(
        getIt<ProductDataSource>(),
        getIt<LocalStorage>(),
      ),
    );
  }
}
