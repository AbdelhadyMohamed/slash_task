class DetailedProduct {
  DetailedProduct({
    this.data,
    this.message,
    this.statusCode,
  });

  DetailedProduct.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    statusCode = json['statusCode'];
  }
  Data? data;
  String? message;
  int? statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    map['statusCode'] = statusCode;
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.name,
    this.description,
    this.brandId,
    this.bostaSizeId,
    this.productRating,
    this.estimatedDaysPreparing,
    this.sizeChart,
    this.subCategory,
    this.variations,
    this.avaiableProperties,
    this.brandName,
    this.brandImage,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    brandId = json['brand_id'];
    bostaSizeId = json['bosta_size_id'];
    productRating = json['product_rating'];
    estimatedDaysPreparing = json['estimated_days_preparing'];
    sizeChart = json['SizeChart'];
    subCategory = json['subCategory'] != null
        ? SubCategory.fromJson(json['subCategory'])
        : null;
    if (json['variations'] != null) {
      variations = [];
      json['variations'].forEach((v) {
        variations?.add(Variations.fromJson(v));
      });
    }
    if (json['avaiableProperties'] != null) {
      avaiableProperties = [];
      json['avaiableProperties'].forEach((v) {
        avaiableProperties?.add(AvaiableProperties.fromJson(v));
      });
    }
    brandName = json['brandName'];
    brandImage = json['brandImage'];
  }
  int? id;
  String? name;
  String? description;
  int? brandId;
  int? bostaSizeId;
  int? productRating;
  int? estimatedDaysPreparing;
  dynamic sizeChart;
  SubCategory? subCategory;
  List<Variations>? variations;
  List<AvaiableProperties>? avaiableProperties;
  String? brandName;
  String? brandImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['brand_id'] = brandId;
    map['bosta_size_id'] = bostaSizeId;
    map['product_rating'] = productRating;
    map['estimated_days_preparing'] = estimatedDaysPreparing;
    map['SizeChart'] = sizeChart;
    if (subCategory != null) {
      map['subCategory'] = subCategory?.toJson();
    }
    if (variations != null) {
      map['variations'] = variations?.map((v) => v.toJson()).toList();
    }
    if (avaiableProperties != null) {
      map['avaiableProperties'] =
          avaiableProperties?.map((v) => v.toJson()).toList();
    }
    map['brandName'] = brandName;
    map['brandImage'] = brandImage;
    return map;
  }
}

class AvaiableProperties {
  AvaiableProperties({
    this.property,
    this.values,
  });

  AvaiableProperties.fromJson(dynamic json) {
    property = json['property'];
    if (json['values'] != null) {
      values = [];
      json['values'].forEach((v) {
        values?.add(Values.fromJson(v));
      });
    }
  }
  String? property;
  List<Values>? values;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['property'] = property;
    if (values != null) {
      map['values'] = values?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Values {
  Values({
    this.value,
    this.id,
  });

  Values.fromJson(dynamic json) {
    value = json['value'];
    id = json['id'];
  }
  String? value;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['id'] = id;
    return map;
  }
}

class Variations {
  Variations({
    this.id,
    this.price,
    this.quantity,
    this.inStock,
    this.productVarientImages,
    this.productPropertiesValues,
    this.productStatus,
    this.isDefault,
    this.productVariationStatusId,
  });

  Variations.fromJson(dynamic json) {
    id = json['id'];
    price = json['price'];
    quantity = json['quantity'];
    inStock = json['inStock'];
    if (json['ProductVarientImages'] != null) {
      productVarientImages = [];
      json['ProductVarientImages'].forEach((v) {
        productVarientImages?.add(ProductVarientImages.fromJson(v));
      });
    }
    if (json['productPropertiesValues'] != null) {
      productPropertiesValues = [];
      json['productPropertiesValues'].forEach((v) {
        productPropertiesValues?.add(ProductPropertiesValues.fromJson(v));
      });
    }
    productStatus = json['productStatus'];
    isDefault = json['isDefault'];
    productVariationStatusId = json['product_variation_status_id'];
  }
  int? id;
  int? price;
  int? quantity;
  bool? inStock;
  List<ProductVarientImages>? productVarientImages;
  List<ProductPropertiesValues>? productPropertiesValues;
  String? productStatus;
  bool? isDefault;
  int? productVariationStatusId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['price'] = price;
    map['quantity'] = quantity;
    map['inStock'] = inStock;
    if (productVarientImages != null) {
      map['ProductVarientImages'] =
          productVarientImages?.map((v) => v.toJson()).toList();
    }
    if (productPropertiesValues != null) {
      map['productPropertiesValues'] =
          productPropertiesValues?.map((v) => v.toJson()).toList();
    }
    map['productStatus'] = productStatus;
    map['isDefault'] = isDefault;
    map['product_variation_status_id'] = productVariationStatusId;
    return map;
  }
}

class ProductPropertiesValues {
  ProductPropertiesValues({
    this.value,
    this.property,
  });

  ProductPropertiesValues.fromJson(dynamic json) {
    value = json['value'];
    property = json['property'];
  }
  String? value;
  String? property;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['property'] = property;
    return map;
  }
}

class ProductVarientImages {
  ProductVarientImages({
    this.id,
    this.imagePath,
    this.productVarientId,
    this.createdAt,
    this.updatedAt,
  });

  ProductVarientImages.fromJson(dynamic json) {
    id = json['id'];
    imagePath = json['image_path'];
    productVarientId = json['product_varient_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  int? id;
  String? imagePath;
  dynamic productVarientId;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image_path'] = imagePath;
    map['product_varient_id'] = productVarientId;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}

class SubCategory {
  SubCategory({
    this.id,
    this.name,
  });

  SubCategory.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
