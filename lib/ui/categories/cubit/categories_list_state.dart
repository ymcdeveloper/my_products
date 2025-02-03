part of 'categories_list_cubit.dart';

@immutable
sealed class CategoriesListState {}

final class CategoriesListInitial extends CategoriesListState {}

final class CategoriesListLoading extends CategoriesListState {}

final class CategoriesListSuccess extends CategoriesListState {
  final List<Category> categories;

  CategoriesListSuccess(this.categories);
}

final class CategoriesListFailure extends CategoriesListState {
  final String message;

  CategoriesListFailure(this.message);
}
