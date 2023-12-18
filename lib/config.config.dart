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
import 'products_screen/data/data_sources/remote/products_ds.dart' as _i4;
import 'products_screen/data/data_sources/remote/products_ds_impl.dart' as _i5;
import 'products_screen/data/repositories/get_product_repo_jmpl.dart' as _i7;
import 'products_screen/domain/repositories/get_products_repo.dart' as _i6;
import 'products_screen/domain/use_cases/get_products.dart' as _i8;
import 'products_screen/presentation/manager/product_bloc.dart' as _i9;

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
    gh.factory<_i4.ProductsDataSource>(
        () => _i5.ProductsDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.ProductRepo>(
        () => _i7.ProductRepoImpl(gh<_i4.ProductsDataSource>()));
    gh.factory<_i8.ProductListUseCase>(
        () => _i8.ProductListUseCase(gh<_i6.ProductRepo>()));
    gh.factory<_i9.ProductBloc>(
        () => _i9.ProductBloc(gh<_i8.ProductListUseCase>()));
    return this;
  }
}
