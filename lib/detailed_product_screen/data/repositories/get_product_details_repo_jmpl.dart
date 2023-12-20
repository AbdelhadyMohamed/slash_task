import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:slash/detailed_product_screen/data/data_sources/remote/products_details_ds.dart';
import 'package:slash/products_screen/data/data_sources/remote/products_ds.dart';
import 'package:slash/products_screen/domain/repositories/get_products_repo.dart';
import '../../../core/utils/failures.dart';
import '../../domain/repositories/get_products_repo.dart';
import '../models/DetailedProduct.dart';

@Injectable(as: ProductDetailsRepo)
class ProductDetailsRepoImpl implements ProductDetailsRepo {
  ProductDetailsDataSource productDetailsDataSource;
  ProductDetailsRepoImpl(this.productDetailsDataSource);

  @override
  Future<Either<DetailedProduct?, Failures>> getProductDetails(String id) =>
      productDetailsDataSource.getProductDetails(id);
}
