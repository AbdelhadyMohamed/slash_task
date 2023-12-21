import 'package:either_dart/either.dart';

import '../../../core/utils/failures.dart';
import '../../data/models/DetailedProduct.dart';

abstract class ProductDetailsRepo {
  Future<Either<DetailedProduct?, Failures>> getProductDetails(String id);
}
