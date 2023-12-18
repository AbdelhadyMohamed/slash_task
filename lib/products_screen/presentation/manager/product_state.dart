part of 'product_bloc.dart';

enum ScreenStatus { init, success, failure, loading }

@immutable
class ProductState {
  final ScreenStatus? screenStatus;
  final ProductModel? productModel;
  final Failures? failures;

  const ProductState({this.screenStatus, this.productModel, this.failures});
  ProductState copyWith(
      {ScreenStatus? screenStatus,
      ProductModel? productModel,
      Failures? failures}) {
    return ProductState(
        screenStatus: screenStatus,
        productModel: productModel,
        failures: failures);
  }
}

class ProductInitial extends ProductState {
  const ProductInitial() : super(screenStatus: ScreenStatus.init);
}
