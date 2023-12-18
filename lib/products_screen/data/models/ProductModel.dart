class ProductModel {
  ProductModel({
    this.statusCode,
    this.message,
    this.pagination,
    this.data,
  });

  ProductModel.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  int? statusCode;
  String? message;
  Pagination? pagination;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['message'] = message;
    if (pagination != null) {
      map['pagination'] = pagination?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.name,
    this.description,
    this.subCategoryId,
    this.brandId,
    this.bostaSizeId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.productRating,
    this.estimatedDaysPreparing,
    this.brands,
    this.productVariations,
    this.subCategories,
    this.sizeChart,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    subCategoryId = json['sub_category_id'];
    brandId = json['brand_id'];
    bostaSizeId = json['bosta_size_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    productRating = json['product_rating'];
    estimatedDaysPreparing = json['estimated_days_preparing'];
    brands = json['Brands'] != null ? Brands.fromJson(json['Brands']) : null;
    if (json['ProductVariations'] != null) {
      productVariations = [];
      json['ProductVariations'].forEach((v) {
        productVariations?.add(ProductVariations.fromJson(v));
      });
    }
    subCategories = json['SubCategories'] != null
        ? SubCategories.fromJson(json['SubCategories'])
        : null;
    sizeChart = json['SizeChart'];
  }
  int? id;
  String? name;
  String? description;
  int? subCategoryId;
  int? brandId;
  int? bostaSizeId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  int? productRating;
  int? estimatedDaysPreparing;
  Brands? brands;
  List<ProductVariations>? productVariations;
  SubCategories? subCategories;
  dynamic sizeChart;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['sub_category_id'] = subCategoryId;
    map['brand_id'] = brandId;
    map['bosta_size_id'] = bostaSizeId;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['deletedAt'] = deletedAt;
    map['product_rating'] = productRating;
    map['estimated_days_preparing'] = estimatedDaysPreparing;
    if (brands != null) {
      map['Brands'] = brands?.toJson();
    }
    if (productVariations != null) {
      map['ProductVariations'] =
          productVariations?.map((v) => v.toJson()).toList();
    }
    if (subCategories != null) {
      map['SubCategories'] = subCategories?.toJson();
    }
    map['SizeChart'] = sizeChart;
    return map;
  }
}

class SubCategories {
  SubCategories({
    this.id,
    this.name,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.categoryId,
    this.imagePath,
  });

  SubCategories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    deletedAt = json['deletedAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    categoryId = json['category_id'];
    imagePath = json['image_path'];
  }
  int? id;
  String? name;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  int? categoryId;
  String? imagePath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['deletedAt'] = deletedAt;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['category_id'] = categoryId;
    map['image_path'] = imagePath;
    return map;
  }
}

class ProductVariations {
  ProductVariations({
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.isDefault,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.productVariationStatusId,
    this.productStatusLookups,
    this.productVarientImages,
  });

  ProductVariations.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    price = json['price'];
    quantity = json['quantity'];
    isDefault = json['is_default'];
    deletedAt = json['deletedAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    productVariationStatusId = json['product_variation_status_id'];
    productStatusLookups = json['ProductStatusLookups'] != null
        ? ProductStatusLookups.fromJson(json['ProductStatusLookups'])
        : null;
    if (json['ProductVarientImages'] != null) {
      productVarientImages = [];
      json['ProductVarientImages'].forEach((v) {
        productVarientImages?.add(ProductVarientImages.fromJson(v));
      });
    }
  }
  int? id;
  int? productId;
  int? price;
  int? quantity;
  bool? isDefault;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  int? productVariationStatusId;
  ProductStatusLookups? productStatusLookups;
  List<ProductVarientImages>? productVarientImages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['price'] = price;
    map['quantity'] = quantity;
    map['is_default'] = isDefault;
    map['deletedAt'] = deletedAt;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['product_variation_status_id'] = productVariationStatusId;
    if (productStatusLookups != null) {
      map['ProductStatusLookups'] = productStatusLookups?.toJson();
    }
    if (productVarientImages != null) {
      map['ProductVarientImages'] =
          productVarientImages?.map((v) => v.toJson()).toList();
    }
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

class ProductStatusLookups {
  ProductStatusLookups({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  ProductStatusLookups.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}

class Brands {
  Brands({
    this.id,
    this.brandName,
    this.brandFacebookPageLink,
    this.brandInstagramPageLink,
    this.brandWebsiteLink,
    this.brandMobileNumber,
    this.brandEmailAddress,
    this.taxIdNumber,
    this.brandDescription,
    this.brandLogoImagePath,
    this.brandStatusId,
    this.brandStoreAddressId,
    this.brandCategoryId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.brandSellerId,
    this.brandId,
    this.slashContractPath,
    this.brandRating,
    this.daysLimitToReturn,
    this.planId,
  });

  Brands.fromJson(dynamic json) {
    id = json['id'];
    brandName = json['brand_name'];
    brandFacebookPageLink = json['brand_facebook_page_link'];
    brandInstagramPageLink = json['brand_instagram_page_link'];
    brandWebsiteLink = json['brand_website_link'];
    brandMobileNumber = json['brand_mobile_number'];
    brandEmailAddress = json['brand_email_address'];
    taxIdNumber = json['tax_id_number'];
    brandDescription = json['brand_description'];
    brandLogoImagePath = json['brand_logo_image_path'];
    brandStatusId = json['brand_status_id'];
    brandStoreAddressId = json['brand_store_address_id'];
    brandCategoryId = json['brand_category_id'];
    deletedAt = json['deletedAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    brandSellerId = json['brand_seller_id'];
    brandId = json['brand_id'];
    slashContractPath = json['slash_contract_path'];
    brandRating = json['brand_rating'];
    daysLimitToReturn = json['days_limit_to_return'];
    planId = json['planId'];
  }
  int? id;
  String? brandName;
  dynamic brandFacebookPageLink;
  dynamic brandInstagramPageLink;
  dynamic brandWebsiteLink;
  String? brandMobileNumber;
  String? brandEmailAddress;
  dynamic taxIdNumber;
  String? brandDescription;
  String? brandLogoImagePath;
  int? brandStatusId;
  dynamic brandStoreAddressId;
  int? brandCategoryId;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  int? brandSellerId;
  dynamic brandId;
  dynamic slashContractPath;
  int? brandRating;
  int? daysLimitToReturn;
  dynamic planId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['brand_name'] = brandName;
    map['brand_facebook_page_link'] = brandFacebookPageLink;
    map['brand_instagram_page_link'] = brandInstagramPageLink;
    map['brand_website_link'] = brandWebsiteLink;
    map['brand_mobile_number'] = brandMobileNumber;
    map['brand_email_address'] = brandEmailAddress;
    map['tax_id_number'] = taxIdNumber;
    map['brand_description'] = brandDescription;
    map['brand_logo_image_path'] = brandLogoImagePath;
    map['brand_status_id'] = brandStatusId;
    map['brand_store_address_id'] = brandStoreAddressId;
    map['brand_category_id'] = brandCategoryId;
    map['deletedAt'] = deletedAt;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['brand_seller_id'] = brandSellerId;
    map['brand_id'] = brandId;
    map['slash_contract_path'] = slashContractPath;
    map['brand_rating'] = brandRating;
    map['days_limit_to_return'] = daysLimitToReturn;
    map['planId'] = planId;
    return map;
  }
}

class Pagination {
  Pagination({
    this.pages,
  });

  Pagination.fromJson(dynamic json) {
    pages = json['pages'];
  }
  dynamic pages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pages'] = pages;
    return map;
  }
}
