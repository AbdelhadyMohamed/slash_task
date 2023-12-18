import 'package:either_dart/either.dart';

import '../../../core/utils/failures.dart';
import '../../data/models/ProductModel.dart';

abstract class ProductRepo {
  Future<Either<ProductModel?, Failures>> getProducts();
}
