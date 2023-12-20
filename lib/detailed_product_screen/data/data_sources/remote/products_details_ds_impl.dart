import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:slash/core/api/api_manager.dart';
import 'package:slash/core/utils/constants.dart';
import 'package:slash/detailed_product_screen/data/data_sources/remote/products_details_ds.dart';
import 'package:slash/products_screen/data/data_sources/remote/products_ds.dart';
import 'package:slash/products_screen/data/models/product.dart';

import '../../../../core/utils/failures.dart';
import '../../models/DetailedProduct.dart';

@Injectable(as: ProductDetailsDataSource)
class ProductDetailsDataSourceImpl implements ProductDetailsDataSource {
  ApiManager apiManager;
  ProductDetailsDataSourceImpl(this.apiManager);

  @override
  Future<Either<DetailedProduct?, Failures>> getProductDetails(
      String id) async {
    try {
      Response response =
          await apiManager.getData('${Constants.productEndpoint}/$id');
      DetailedProduct detailedProduct = DetailedProduct.fromJson(response.data);

      return Left(detailedProduct);
    } catch (e) {
      debugPrint(e.toString());
      return Right(RemoteFailures(e.toString()));
    }
  }
}
