import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:slash/core/api/api_manager.dart';
import 'package:slash/core/utils/constants.dart';
import 'package:slash/products_screen/data/data_sources/remote/products_ds.dart';
import 'package:slash/products_screen/data/models/product.dart';

import '../../../../core/utils/failures.dart';
import '../../models/ProductModel.dart';

@Injectable(as: ProductsDataSource)
class ProductsDataSourceImpl implements ProductsDataSource {
  ApiManager apiManager;
  ProductsDataSourceImpl(this.apiManager);

  @override
  Future<Either<ProductModel?, Failures>> getProducts() async {
    try {
      Response response = await apiManager.getData(Constants.productEndpoint);
      ProductModel productModel = ProductModel.fromJson(response.data);

      return Left(productModel);
    } catch (e) {
      debugPrint(e.toString());
      return Right(RemoteFailures(e.toString()));
    }
  }
}
