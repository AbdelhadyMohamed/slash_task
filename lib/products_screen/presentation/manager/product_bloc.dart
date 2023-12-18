import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/failures.dart';
import '../../data/models/ProductModel.dart';
import '../../domain/use_cases/get_products.dart';

part 'product_event.dart';
part 'product_state.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductListUseCase productListUseCase;
  ProductBloc(this.productListUseCase) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      emit(state.copyWith(screenStatus: ScreenStatus.loading));
      if (event is FetchAllProducts) {
        var result = await productListUseCase.call();
        result.fold(
          (left) {
            emit(state.copyWith(
                productModel: left, screenStatus: ScreenStatus.success));
          },
          (right) {
            emit(state.copyWith(
                failures: right, screenStatus: ScreenStatus.failure));
          },
        );
      }
    });
  }
}
