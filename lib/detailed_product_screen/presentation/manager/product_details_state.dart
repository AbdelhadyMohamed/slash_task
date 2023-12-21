part of 'product_details_bloc.dart';

enum ScreenState {
  init,
  success,
  failure,
  loading,
  colorChange,
  sizeChange,
  materialChange
}

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
  final int? variationID;
  final Variations? variation;
  final int? sizeIndex;
  final int? materialIndex;

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
      this.variationID,
      this.variation,
      this.sizeIndex,
      this.materialIndex});
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
      int? variationID,
      Variations? variation,
      int? sizeIndex,
      int? materialIndex}) {
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
        variationID: variationID ?? 0,
        variation: variation,
        sizeIndex: sizeIndex,
        materialIndex: materialIndex);
  }
}

class ProductInitial extends ProductDetailsState {
  const ProductInitial() : super(screenState: ScreenState.init);
}
