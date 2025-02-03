part of 'product_list_cubit.dart';

@immutable
sealed class ProductListState extends Equatable {}

final class ProductListInitial extends ProductListState {
  @override
  List<Object?> get props => [];
}
final class ProductListLoading extends ProductListState {
  @override
  List<Object?> get props => [];
}
final class ProductListSuccess extends ProductListState {
  final List<Product> products;

  ProductListSuccess(this.products);

  @override
  List<Object?> get props => [products];
}

final class ProductListFailure extends ProductListState {
  final Failure failure;

  ProductListFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}
