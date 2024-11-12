class ProductDetailsModel {
  String? message;
  Data? data;

  ProductDetailsModel({this.message, this.data});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? productId;
  String? productName;
  String? description;
  String? createdAt;
  bool? isDisabled;
  String? productStatus;
  String? adminApprovalStatus;
  String? adminRemarks;
  String? updatedAt;
  List<Variants>? variants;
  Category? category;
  Brand? brand;
  Store? store;

  Data(
      {this.productId,
      this.productName,
      this.description,
      this.createdAt,
      this.isDisabled,
      this.productStatus,
      this.adminApprovalStatus,
      this.adminRemarks,
      this.updatedAt,
      this.variants,
      this.category,
      this.brand,
      this.store});

  Data.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    description = json['description'];
    createdAt = json['createdAt'];
    isDisabled = json['isDisabled'];
    productStatus = json['product_status'];
    adminApprovalStatus = json['admin_approval_status'];
    adminRemarks = json['adminRemarks'];
    updatedAt = json['updatedAt'];
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(new Variants.fromJson(v));
      });
    }
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['description'] = this.description;
    data['createdAt'] = this.createdAt;
    data['isDisabled'] = this.isDisabled;
    data['product_status'] = this.productStatus;
    data['admin_approval_status'] = this.adminApprovalStatus;
    data['adminRemarks'] = this.adminRemarks;
    data['updatedAt'] = this.updatedAt;
    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
    return data;
  }
}

class Variants {
  int? variantId;
  String? sellingPrice;
  String? mrp;
  dynamic tax;
  String? color;
  String? size;
  String? material;
  String? productDimensions;
  String? weight;
  String? discount;
  int? quantity;
  String? description;
  String? inStock;
  String? approvalStatus;
  bool? isDisabled;
  String? createdAt;
  String? updatedAt;
  Media? media;

  Variants(
      {this.variantId,
      this.sellingPrice,
      this.mrp,
      this.tax,
      this.color,
      this.size,
      this.material,
      this.productDimensions,
      this.weight,
      this.discount,
      this.quantity,
      this.description,
      this.inStock,
      this.approvalStatus,
      this.isDisabled,
      this.createdAt,
      this.updatedAt,
      this.media});

  Variants.fromJson(Map<String, dynamic> json) {
    variantId = json['variant_id'];
    sellingPrice = json['sellingPrice'];
    mrp = json['mrp'];
    tax = json['tax'];
    color = json['color'];
    size = json['size'];
    material = json['material'];
    productDimensions = json['productDimensions'];
    weight = json['weight'];
    discount = json['discount'];
    quantity = json['quantity'];
    description = json['description'];
    inStock = json['inStock'];
    approvalStatus = json['approvalStatus'];
    isDisabled = json['isDisabled'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    media = json['media'] != null ? new Media.fromJson(json['media']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variant_id'] = this.variantId;
    data['sellingPrice'] = this.sellingPrice;
    data['mrp'] = this.mrp;
    data['tax'] = this.tax;
    data['color'] = this.color;
    data['size'] = this.size;
    data['material'] = this.material;
    data['productDimensions'] = this.productDimensions;
    data['weight'] = this.weight;
    data['discount'] = this.discount;
    data['quantity'] = this.quantity;
    data['description'] = this.description;
    data['inStock'] = this.inStock;
    data['approvalStatus'] = this.approvalStatus;
    data['isDisabled'] = this.isDisabled;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.media != null) {
      data['media'] = this.media!.toJson();
    }
    return data;
  }
}

class Media {
  int? mediaId;
  List<String>? images;
  String? videos;
  String? createdAt;
  String? updatedAt;

  Media(
      {this.mediaId, this.images, this.videos, this.createdAt, this.updatedAt});

  Media.fromJson(Map<String, dynamic> json) {
    mediaId = json['media_id'];
    images = json['images'].cast<String>();
    videos = json['videos'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['media_id'] = this.mediaId;
    data['images'] = this.images;
    data['videos'] = this.videos;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Category {
  int? categoryId;
  String? categoryName;

  Category({this.categoryId, this.categoryName});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    return data;
  }
}

class Brand {
  int? brandId;
  String? brandName;

  Brand({this.brandId, this.brandName});

  Brand.fromJson(Map<String, dynamic> json) {
    brandId = json['brand_id'];
    brandName = json['brand_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand_id'] = this.brandId;
    data['brand_name'] = this.brandName;
    return data;
  }
}

class Store {
  int? storeId;
  String? storeName;

  Store({this.storeId, this.storeName});

  Store.fromJson(Map<String, dynamic> json) {
    storeId = json['store_id'];
    storeName = json['store_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_id'] = this.storeId;
    data['store_name'] = this.storeName;
    return data;
  }
}
