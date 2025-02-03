import 'package:my_products/utils/errors/failure.dart';

class GetCategoriesFailure extends Failure {
  GetCategoriesFailure(super.message);
}

class GetProductsByCategoryFailure extends Failure {
  GetProductsByCategoryFailure(super.message);
}
