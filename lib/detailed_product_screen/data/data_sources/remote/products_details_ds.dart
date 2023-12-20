import 'package:either_dart/either.dart';

import '../../../../core/utils/failures.dart';
import '../../models/DetailedProduct.dart';

abstract class ProductDetailsDataSource {
  Future<Either<DetailedProduct?, Failures>> getProductDetails(String id);
}
