class AddProductMediaModel {
  String? message;
  Data? data;

  AddProductMediaModel({this.message, this.data});

  AddProductMediaModel.fromJson(Map<String, dynamic> json) {
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
  Images? images;
  Variant? variant;
  String? videos;
  int? mediaId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.images,
      this.variant,
      this.videos,
      this.mediaId,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    variant =
        json['variant'] != null ? new Variant.fromJson(json['variant']) : null;
    videos = json['videos'];
    mediaId = json['media_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    if (this.variant != null) {
      data['variant'] = this.variant!.toJson();
    }
    data['videos'] = this.videos;
    data['media_id'] = this.mediaId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Images {
  String? frontView;
  String? frontRight;
  String? rearView;

  Images({this.frontView, this.frontRight, this.rearView});

  Images.fromJson(Map<String, dynamic> json) {
    frontView = json['frontView'];
    frontRight = json['frontRight'];
    rearView = json['rearView'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['frontView'] = this.frontView;
    data['frontRight'] = this.frontRight;
    data['rearView'] = this.rearView;
    return data;
  }
}

class Variant {
  String? variantId;

  Variant({this.variantId});

  Variant.fromJson(Map<String, dynamic> json) {
    variantId = json['variant_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variant_id'] = this.variantId;
    return data;
  }
}
