import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/failures.dart';
import '../../data/models/DetailedProduct.dart';
import '../../domain/use_cases/get_product_details.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

@injectable
class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  static ProductDetailsBloc get(context) => BlocProvider.of(context);
  ProductDetailsUseCase productDetailsUseCase;
  ProductDetailsBloc(this.productDetailsUseCase)
      : super(const ProductInitial()) {
    on<ProductDetailsEvent>((event, emit) async {
      emit(state.copyWith(screenState: ScreenState.loading));
      if (event is FetchProductDetails) {
        bool isColor = false;
        bool isSize = false;
        bool isMaterial = false;
        var result = await productDetailsUseCase.call(event.id);
        result.fold(
          (left) {
            if (checkColor(left?.data?.avaiableProperties)) {
              isColor = true;
            }
            if (checkSize(left?.data?.avaiableProperties)) {
              isSize = true;
            }
            if (checkMaterial(left?.data?.avaiableProperties)) {
              isMaterial = true;
            }
            emit(state.copyWith(
              detailedProduct: left,
              screenState: ScreenState.success,
              areThereColors: isColor,
              areThereMaterials: isMaterial,
              areThereSizes: isSize,
              colorsList: getColorsList(left?.data?.avaiableProperties),
              sizesList: getSizesList(left?.data?.avaiableProperties),
              materialsList: getMaterialsList(left?.data?.avaiableProperties),
            ));
          },
          (right) {
            emit(state.copyWith(
                failures: right, screenState: ScreenState.failure));
          },
        );
      } else if (event is ColorClickedEvent) // if color changed in the ui
      {
        bool isColor = false;
        bool isSize = false;
        bool isMaterial = false;
        var result = await productDetailsUseCase.call(event.id.toString());
        result.fold(
          (left) {
            if (checkColor(left?.data?.avaiableProperties)) {
              isColor = true;
            }
            if (checkSize(left?.data?.avaiableProperties)) {
              isSize = true;
            }
            if (checkMaterial(left?.data?.avaiableProperties)) {
              isMaterial = true;
            }
            int? id = getColorId(event.color, left?.data?.avaiableProperties);
            Variations? variation =
                getColorVariation(id.toString(), left?.data?.variations);
            emit(state.copyWith(
              variation: variation,
              detailedProduct: left,
              screenState: ScreenState.colorChange,
              areThereColors: isColor,
              areThereMaterials: isMaterial,
              areThereSizes: isSize,
              colorsList: getColorsList(left?.data?.avaiableProperties),
              sizesList: getSizesList(left?.data?.avaiableProperties),
              materialsList: getMaterialsList(left?.data?.avaiableProperties),
            ));
          },
          (right) {
            emit(state.copyWith(
                failures: right, screenState: ScreenState.failure));
          },
        );
      }
    });
  }
}

bool checkColor(
    List<AvaiableProperties>?
        prop) // check if there is available colors  for this product
{
  if (prop == null || prop.isEmpty) {
    return false; // if list empty  that means there is no colors
  }
  for (int i = 0; i < prop.length; i++) {
    if (prop[i].property == "Color") {
      return true; // if we reach property color so that means there is colors
    }
  }
  return false;
}

bool checkSize(
    List<AvaiableProperties>?
        prop) // check if there is available sizes  for this product
{
  if (prop == null || prop.isEmpty) return false;
  for (int i = 0; i < prop.length; i++) {
    if (prop[i].property == "Size") return true;
  }
  return false;
}

bool checkMaterial(
    List<AvaiableProperties>?
        prop) //check if there is available materials  for this product
{
  if (prop == null || prop.isEmpty) return false;
  for (int i = 0; i < prop.length; i++) {
    if (prop[i].property == "Materials") return true;
  }
  return false;
}

Set<String>? getColorsList(
    List<AvaiableProperties>?
        prop) // get the colors list(it could be null so that means there is no colors same as if previous function returns false so we can remove the boolean function
{
  if (prop?.length ==
      null) //if list is empty that means there is no colors ,sizes or materials
  {
    return null;
  }
  Set<String>?
      colorsList; // set data structure is used instead of list because we do not want to add redundant data(colors or others)

  for (int i = 0; i < prop!.length; i++) {
    if (prop[i].property == "Color") {
      colorsList = {};
      for (int j = 0; j < prop[i].values!.length; j++) {
        if (prop[i].values![j].value != null) {
          colorsList.add(prop[i].values![j].value!.replaceAll("#",
              "")); // some of colors come from api with # so we need to remove it first
        }
      }
      break;
    }
  }
  return colorsList;
}

Set<String>? getSizesList(
    List<AvaiableProperties>? prop) // same as getColorsList function
{
  if (prop?.length == null) return null;
  Set<String>? sizesList;

  for (int i = 0; i < prop!.length; i++) {
    if (prop[i].property == "Size") {
      sizesList = {};
      for (int j = 0; j < prop[i].values!.length; j++) {
        if (prop[i].values![j].value != null) {
          sizesList.add(prop[i]
              .values![j]
              .value!
              .toUpperCase()); // to upper case because some sizes are in lower case and rest of them are upper
        }
      }
      break;
    }
  }
  return sizesList;
}

Set<String>? getMaterialsList(List<AvaiableProperties>? prop) {
  if (prop?.length == null) return null;
  Set<String>? materialsList;

  for (int i = 0; i < prop!.length; i++) {
    if (prop[i].property == "Materials") {
      materialsList = {};
      for (int j = 0; j < prop[i].values!.length; j++) {
        if (prop[i].values![j].value != null) {
          materialsList.add(prop[i].values![j].value!);
        }
      }
      break;
    }
  }
  return materialsList;
}

int? getColorId(String color, List<AvaiableProperties>? properties) {
  print(color);
  for (int i = 0; i < properties!.length; i++) {
    if (properties[i].property == "Color") {
      for (int j = 0; j < properties[i].values!.length; j++) {
        print(properties[i].values?[j].value);

        if (properties[i].values?[j].value?.replaceAll("#", "") == color) {
          return properties[i].values?[j].id;
        }
      }
    }
  }
  return null;
}

Variations? getColorVariation(String id, List<Variations>? vars) {
  for (int i = 0; i < vars!.length; i++) {
    if (vars[i].id.toString() == id) {
      return vars[i];
    }
  }
  return null;
}
