import 'package:slash/products_screen/data/models/product_property.dart';
import 'package:slash/products_screen/data/models/product_variation.dart';

class Product {
  int? id;
  String? name;
  String? description;
  int? brandId;
  String? brandName;
  String? brandLogoUrl;
  double? rating;
  List<ProductVariation>? variations;
  List<ProductProperty>?
      availableProperties; //What properties are offered //(multiple colors or non, multiple sizes or non, materials)
}
