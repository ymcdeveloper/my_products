import 'package:go_router/go_router.dart';
import 'package:my_products/ui/categories/categories_list.dart';

class Routes {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => CategoriesList(),
      ),
    ],
  );
}
