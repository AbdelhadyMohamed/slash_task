import 'package:slash/products_screen/data/models/product_property_value.dart';

class ProductVariation {
  int? id;
  int? productId;
  num? price;
  int? quantity;
  bool? inStock; //to enable/disable addToCart button
  List<String>? productVarientImages;
  List<ProductPropertyAndValue>? productPropertiesValues;
}
