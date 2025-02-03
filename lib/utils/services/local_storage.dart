import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final SharedPreferences _sharedPreferences;

  LocalStorage({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  Future<void> wishlistProduct(int productId) async {
    try {
      final wishlist = _sharedPreferences.getStringList('wishlist') ?? [];
      wishlist.add(productId.toString());
      await _sharedPreferences.setStringList('wishlist', wishlist);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeWishlist(int productId) async {
    try {
      final wishlist = _sharedPreferences.getStringList('wishlist') ?? [];
      wishlist.remove(productId.toString());
      await _sharedPreferences.setStringList('wishlist', wishlist);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<int>> getWishlist() async {
    try {
      final wishlist = _sharedPreferences.getStringList('wishlist') ?? [];
      return wishlist.map((e) => int.parse(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
