part of 'product_details_bloc.dart';

enum ScreenState { init, success, failure, loading }

@immutable
class ProductDetailsState {
  final ScreenState? screenState;
  final DetailedProduct? detailedProduct;
  final Failures? failures;
  final bool? areThereColors;
  final bool? areThereSizes;
  final bool? areThereMaterials;
  final Set<String>? colorsList;
  final Set<String>? sizesList;
  final Set<String>? materialsList;
  final int? variationIndex;

  const ProductDetailsState(
      {this.screenState,
      this.detailedProduct,
      this.failures,
      this.areThereColors,
      this.areThereSizes,
      this.areThereMaterials,
      this.colorsList,
      this.sizesList,
      this.materialsList,
      this.variationIndex});
  ProductDetailsState copyWith(
      {ScreenState? screenState,
      DetailedProduct? detailedProduct,
      Failures? failures,
      bool areThereColors = false,
      bool areThereSizes = false,
      bool areThereMaterials = false,
      Set<String>? colorsList,
      Set<String>? sizesList,
      Set<String>? materialsList,
      int? variationIndex}) {
    return ProductDetailsState(
        screenState: screenState,
        detailedProduct: detailedProduct,
        failures: failures,
        areThereColors: areThereColors,
        areThereSizes: areThereSizes,
        areThereMaterials: areThereMaterials,
        colorsList: colorsList,
        sizesList: sizesList,
        materialsList: materialsList,
        variationIndex: variationIndex ?? 0);
  }
}

class ProductInitial extends ProductDetailsState {
  const ProductInitial() : super(screenState: ScreenState.init);
}
