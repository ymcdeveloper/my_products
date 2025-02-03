import 'package:go_router/go_router.dart';
import 'package:my_products/ui/home/home_page.dart';
import 'package:my_products/ui/products/pages/product_detail_page.dart';
import 'package:my_products/ui/products/pages/product_list_page.dart';

class Routes {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/product_list',
        builder: (context, state) => ProductListPage.fromParams(state.extra as Map<String, dynamic>),
      ),
      GoRoute(
        path: '/product_detail',
        builder: (context, state) => ProductDetailPage.fromParams(state.extra as Map<String, dynamic>),
      ),
    ],
  );
}
