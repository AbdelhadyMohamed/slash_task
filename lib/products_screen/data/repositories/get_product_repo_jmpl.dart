import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:slash/products_screen/data/data_sources/remote/products_ds.dart';
import 'package:slash/products_screen/domain/repositories/get_products_repo.dart';
import '../../../core/utils/failures.dart';
import '../models/ProductModel.dart';

@Injectable(as: ProductRepo)
class ProductRepoImpl implements ProductRepo {
  ProductsDataSource productsDataSource;
  ProductRepoImpl(this.productsDataSource);

  @override
  Future<Either<ProductModel?, Failures>> getProducts() =>
      productsDataSource.getProducts();
}
