import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_products/data/datasources/product/product_datasource.dart';
import 'package:my_products/domain/models/category.dart';
import 'package:my_products/domain/models/product.dart';
import 'package:my_products/utils/services/local_storage.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit(this._dataSource, this._localStorage) : super(WishlistInitial());

  final ProductDataSource _dataSource;
  final LocalStorage _localStorage;

  Future<void> getWishlist() async {
    emit(WishlistLoading());
    final wishlistIds = await _localStorage.getWishlist();
    if(wishlistIds.isEmpty) {
      emit(WishlistEmpty());
      return;
    }
    
    final result = await _dataSource.getProductsByCategory(Category.allCategories);

    result.fold((failure) {
      emit(WishlistFailure(failure.message));
    }, (data) {
      final wishlist = data.where((product) => wishlistIds.contains(product.id)).toList();
      emit(WishlistSuccess(wishlist));
    },);
  }
}
