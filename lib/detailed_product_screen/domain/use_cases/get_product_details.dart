import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../../core/utils/failures.dart';
import '../../data/models/DetailedProduct.dart';
import '../repositories/get_products_repo.dart';

@injectable
class ProductDetailsUseCase {
  ProductDetailsRepo repo;
  ProductDetailsUseCase(this.repo);
  Future<Either<DetailedProduct?, Failures>> call(String id) =>
      repo.getProductDetails(id);
}
