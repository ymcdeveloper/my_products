import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_products/domain/models/category.dart';
import 'package:my_products/domain/repositories/category_repository.dart';

part 'categories_list_state.dart';

class CategoriesListCubit extends Cubit<CategoriesListState> {
  CategoriesListCubit(this._repository) : super(CategoriesListInitial());

  final CategoryRepository _repository;

  Future<void> getCategories() async {
    emit(CategoriesListLoading());
    final result = await _repository.getCategories();
    result.fold(
      (failure) {
        emit(CategoriesListFailure(failure.toString()));
      },
      (data) {
        emit(CategoriesListSuccess(data));
      },
    );
  }
}
