import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../../core/utils/failures.dart';
import '../../data/models/ProductModel.dart';
import '../repositories/get_products_repo.dart';

@injectable
class ProductListUseCase {
  ProductRepo repo;
  ProductListUseCase(this.repo);
  Future<Either<ProductModel?, Failures>> call() => repo.getProducts();
}
