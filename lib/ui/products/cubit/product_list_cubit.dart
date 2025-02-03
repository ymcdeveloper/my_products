import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:my_products/domain/models/category.dart';
import 'package:my_products/domain/models/product.dart';
import 'package:my_products/domain/repositories/product_repository.dart';
import 'package:my_products/utils/errors/failure.dart';

part 'product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  ProductListCubit(this._repository) : super(ProductListInitial());

  final ProductRepository _repository;

  Future<void> getProducts(Category category) async {
    emit(ProductListLoading());
    final result = await _repository.getProductsByCategory(category);

    result.fold((failure) {
      emit(ProductListFailure(failure));
    }, (data) {
      emit(ProductListSuccess(data));
    },);
  }
}
