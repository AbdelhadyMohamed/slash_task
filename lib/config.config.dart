// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/api/api_manager.dart' as _i3;
import 'detailed_product_screen/data/data_sources/remote/products_details_ds.dart'
    as _i4;
import 'detailed_product_screen/data/data_sources/remote/products_details_ds_impl.dart'
    as _i5;
import 'detailed_product_screen/data/repositories/get_product_details_repo_jmpl.dart'
    as _i7;
import 'detailed_product_screen/domain/repositories/get_products_repo.dart'
    as _i6;
import 'detailed_product_screen/domain/use_cases/get_product_details.dart'
    as _i8;
import 'detailed_product_screen/presentation/manager/product_details_bloc.dart'
    as _i11;
import 'products_screen/data/data_sources/remote/products_ds.dart' as _i9;
import 'products_screen/data/data_sources/remote/products_ds_impl.dart' as _i10;
import 'products_screen/data/repositories/get_product_repo_jmpl.dart' as _i13;
import 'products_screen/domain/repositories/get_products_repo.dart' as _i12;
import 'products_screen/domain/use_cases/get_products.dart' as _i14;
import 'products_screen/presentation/manager/product_bloc.dart' as _i15;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(_i3.ApiManager());
    gh.factory<_i4.ProductDetailsDataSource>(
        () => _i5.ProductDetailsDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.ProductDetailsRepo>(
        () => _i7.ProductDetailsRepoImpl(gh<_i4.ProductDetailsDataSource>()));
    gh.factory<_i8.ProductDetailsUseCase>(
        () => _i8.ProductDetailsUseCase(gh<_i6.ProductDetailsRepo>()));
    gh.factory<_i9.ProductsDataSource>(
        () => _i10.ProductsDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i11.ProductDetailsBloc>(
        () => _i11.ProductDetailsBloc(gh<_i8.ProductDetailsUseCase>()));
    gh.factory<_i12.ProductRepo>(
        () => _i13.ProductRepoImpl(gh<_i9.ProductsDataSource>()));
    gh.factory<_i14.ProductListUseCase>(
        () => _i14.ProductListUseCase(gh<_i12.ProductRepo>()));
    gh.factory<_i15.ProductBloc>(
        () => _i15.ProductBloc(gh<_i14.ProductListUseCase>()));
    return this;
  }
}
