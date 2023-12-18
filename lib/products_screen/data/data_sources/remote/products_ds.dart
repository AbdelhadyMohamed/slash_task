import 'package:either_dart/either.dart';

import '../../../../core/utils/failures.dart';
import '../../models/ProductModel.dart';

abstract class ProductsDataSource {
  Future<Either<ProductModel?, Failures>> getProducts();
}
